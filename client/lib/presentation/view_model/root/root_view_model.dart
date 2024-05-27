import 'package:get/get.dart';

class RootViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxInt _selectedIndex;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() {
    super.onInit();

    _selectedIndex = 0.obs;
  }

  void fetchIndex(int index) {
    _selectedIndex.value = index;
  }
}
