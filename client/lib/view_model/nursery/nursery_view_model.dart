import 'package:get/get.dart';
import 'package:nailed_it/model/nursery/nursery_detail_state.dart';

class NurseryViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final int _nurseryId;

  late final Rx<NurseryDetailState> _nurseryDetailState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  int get nurseryId => _nurseryId;

  NurseryDetailState get nurseryDetailState => _nurseryDetailState.value;

  @override
  void onInit() {
    super.onInit();

    _nurseryId = Get.arguments['nurseryId'];
    _nurseryDetailState = const NurseryDetailState(
      dissolvedOxygen: 5.0,
      ammonia: 0.1,
      acidity: 7.0,
      salinity: 0.1,
      turbidity: 0.1,
    ).obs;
  }
}
