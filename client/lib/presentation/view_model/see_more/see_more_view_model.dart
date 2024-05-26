import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nailed_it/domain/entity/see_more/user_state.dart';
import 'package:nailed_it/domain/repository/user/user_repository.dart';
import 'package:nailed_it/domain/usecase/auth/logout_use_case.dart';
import 'package:nailed_it/domain/usecase/auth/withdrawal_use_case.dart';
import 'package:nailed_it/domain/usecase/user/read_user_use_case.dart';
import 'package:nailed_it/domain/usecase/user/update_allowed_notification_use_case.dart';

class SeeMoreViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ReadUserUseCase _readUserUseCase;
  late final UpdateAllowedNotificationUseCase _updateAllowedNotificationUseCase;

  late final LogoutUseCase _logoutUseCase;
  late final WithdrawalUseCase _withdrawalUseCase;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<UserState> _user;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  UserState get user => _user.value;

  @override
  void onInit() {
    super.onInit();

    // DI
    _readUserUseCase = ReadUserUseCase(
      userRepository: Get.find<UserRepository>(),
    );
    _updateAllowedNotificationUseCase = UpdateAllowedNotificationUseCase(
      userRepository: Get.find<UserRepository>(),
    );
    _logoutUseCase = LogoutUseCase(
      userRepository: Get.find<UserRepository>(),
    );
    _withdrawalUseCase = WithdrawalUseCase(
      userRepository: Get.find<UserRepository>(),
    );

    // Private Fields
    _user = UserState.initial().obs;

    // Fetch User State
    fetchUserState();
  }

  void fetchUserState() async {
    UserState user = await _readUserUseCase.execute();

    _user.value = user;
  }

  void fetchAllowedNotification({
    required bool allowedNotification,
  }) async {
    await _updateAllowedNotificationUseCase.execute(
      allowedNotification,
    );

    _user.value = _user.value.copyWith(
      isAllowedNotification: allowedNotification,
    );
  }

  Future<bool> logout() async {
    return await _logoutUseCase.execute();
  }

  Future<bool> withdrawal() async {
    try {
      await _withdrawalUseCase.execute();
      await FirebaseAuth.instance.currentUser!.delete();
    } catch (e) {
      return false;
    }

    return true;
  }
}
