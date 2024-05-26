import 'package:get/get.dart';
import 'package:nailed_it/data/repository/user_repository_impl.dart';
import 'package:nailed_it/domain/repository/user_repository.dart';

class Dependency extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
  }
}
