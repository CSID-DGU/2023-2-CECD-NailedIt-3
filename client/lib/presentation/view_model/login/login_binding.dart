import 'package:get/get.dart';
import 'package:nailed_it/presentation/view_model/login/login_view_model.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}
