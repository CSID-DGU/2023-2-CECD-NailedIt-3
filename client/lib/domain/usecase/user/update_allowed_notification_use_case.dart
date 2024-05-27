import 'package:nailed_it/core/usecase/param_usecase.dart';
import 'package:nailed_it/domain/repository/user/user_repository.dart';

class UpdateAllowedNotificationUseCase extends ParamUseCase<void, bool> {
  UpdateAllowedNotificationUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<void> execute(bool params) async {
    try {
      await _userRepository.updateAllowedNotification(params);
    } catch (_) {}
  }
}
