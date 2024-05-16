import 'package:get/get.dart';
import 'package:nailed_it/model/nursery/nursery_brief_state.dart';

class HomeViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<NurseryBriefState> _nurseryBriefStates;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<NurseryBriefState> get nurseryBriefStates => _nurseryBriefStates;

  @override
  void onInit() {
    super.onInit();

    _nurseryBriefStates = [
      const NurseryBriefState(
        id: 0,
        dissolvedOxygen: 5.0,
      ),
      const NurseryBriefState(
        id: 1,
        dissolvedOxygen: 4.7,
      ),
      const NurseryBriefState(
        id: 2,
        dissolvedOxygen: 4.9,
      ),
      const NurseryBriefState(
        id: 3,
        dissolvedOxygen: 5.1,
      ),
      const NurseryBriefState(
        id: 4,
        dissolvedOxygen: 4.8,
      ),
      const NurseryBriefState(
        id: 5,
        dissolvedOxygen: 5.2,
      ),
    ].obs;
  }
}
