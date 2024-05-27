import 'package:nailed_it/core/usecase/no_param_usecase.dart';
import 'package:nailed_it/domain/repository/notification/notification_repository.dart';
import 'package:nailed_it/domain/repository/user/user_repository.dart';

class WithdrawalUseCase extends NoParamUseCase<bool> {
  WithdrawalUseCase({
    required UserRepository userRepository,
    required NotificationRepository notificationRepository,
  })  : _userRepository = userRepository,
        _notificationRepository = notificationRepository;

  final UserRepository _userRepository;
  final NotificationRepository _notificationRepository;

  @override
  Future<bool> execute() async {
    bool isWithdrawal = await _userRepository.deleteUser();

    if (!isWithdrawal) {
      return false;
    }

    await _notificationRepository.deleteAll();

    return true;
  }
}
