import 'package:get/get.dart';
import 'package:nailed_it/view_model/profile/profile_view_model.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
  }
}