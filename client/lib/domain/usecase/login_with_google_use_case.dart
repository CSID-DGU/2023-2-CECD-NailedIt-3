import 'package:nailed_it/core/usecase/no_param_usecase.dart';
import 'package:nailed_it/domain/repository/user_repository.dart';

class LoginWithGoogleUseCase extends NoParamUseCase<bool> {
  final UserRepository _userRepository;

  LoginWithGoogleUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<bool> execute() async {
    return await _userRepository.existsUser();
  }
}
