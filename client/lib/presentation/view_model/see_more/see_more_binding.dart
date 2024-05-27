import 'package:get/get.dart';
import 'package:nailed_it/presentation/view_model/see_more/see_more_view_model.dart';

class SeeMoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeMoreViewModel>(() => SeeMoreViewModel());
  }
}
