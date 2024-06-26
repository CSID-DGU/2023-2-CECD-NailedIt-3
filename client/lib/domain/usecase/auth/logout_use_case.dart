import 'package:nailed_it/core/usecase/no_param_usecase.dart';
import 'package:nailed_it/domain/repository/user/user_repository.dart';

class LogoutUseCase extends NoParamUseCase<bool> {
  LogoutUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<bool> execute() async {
    return await _userRepository.updateDeviceToken("");
  }
}
