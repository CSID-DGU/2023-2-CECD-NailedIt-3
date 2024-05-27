import 'package:nailed_it/core/usecase/no_param_usecase.dart';
import 'package:nailed_it/domain/entity/see_more/user_state.dart';
import 'package:nailed_it/domain/repository/user/user_repository.dart';

class ReadUserUseCase extends NoParamUseCase<UserState> {
  ReadUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<UserState> execute() async {
    Map<String, dynamic> result;

    try {
      result = await _userRepository.readUser();

      return UserState.fromJson(result);
    } catch (e) {
      return UserState.initial();
    }
  }
}
