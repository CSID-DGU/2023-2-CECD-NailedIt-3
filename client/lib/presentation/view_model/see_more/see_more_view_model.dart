import 'package:get/get.dart';
import 'package:nailed_it/domain/entity/see_more/user_state.dart';

class SeeMoreViewModel extends GetxController {
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

    _user = UserState.initial().obs;

    fetchUserState();
  }

  void fetchUserState({
    UserState? userState,
  }) {
    if (userState != null) {
      _user.value = userState;

      return;
    }

    _user.value = _user.value.copyWith(
      id: 'asfliselal293lAFSB',
      nickname: 'HyungJoonSon',
    );
  }

  void fetchAllowedNotification({
    required bool allowedNotification,
  }) {
    _user.value = _user.value.copyWith(
      isAllowedNotification: allowedNotification,
    );
  }
}
