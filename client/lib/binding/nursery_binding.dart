import 'package:get/get.dart';
import 'package:nailed_it/view_model/nursery/nursery_view_model.dart';

class NurseryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NurseryViewModel>(() => NurseryViewModel());
  }
}
