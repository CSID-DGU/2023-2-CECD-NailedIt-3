import 'package:nailed_it/core/usecase/no_param_usecase.dart';
import 'package:nailed_it/domain/repository/notification/notification_repository.dart';
import 'package:nailed_it/domain/repository/user/user_repository.dart';

class LoginUseCase extends NoParamUseCase<bool> {
  final UserRepository _userRepository;
  final NotificationRepository _notificationRepository;

  LoginUseCase({
    required UserRepository userRepository,
    required NotificationRepository notificationRepository,
  })  : _userRepository = userRepository,
        _notificationRepository = notificationRepository;

  @override
  Future<bool> execute() async {
    return await _userRepository.existsUser() &&
        await _notificationRepository.existsNotification();
  }
}
