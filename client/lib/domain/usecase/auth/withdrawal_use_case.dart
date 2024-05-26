import 'package:nailed_it/core/usecase/no_param_usecase.dart';
import 'package:nailed_it/domain/repository/notification_history/notification_history_repository.dart';
import 'package:nailed_it/domain/repository/user/user_repository.dart';

class WithdrawalUseCase extends NoParamUseCase<bool> {
  WithdrawalUseCase({
    required UserRepository userRepository,
    required NotificationHistoryRepository notificationHistoryRepository,
  })  : _userRepository = userRepository,
        _notificationHistoryRepository = notificationHistoryRepository;

  final UserRepository _userRepository;
  final NotificationHistoryRepository _notificationHistoryRepository;

  @override
  Future<bool> execute() async {
    bool isWithdrawal = await _userRepository.deleteUser();

    if (!isWithdrawal) {
      return false;
    }

    await _notificationHistoryRepository.deleteAll();

    return true;
  }
}
