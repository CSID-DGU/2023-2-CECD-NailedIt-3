import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/config/color_system.dart';
import 'package:nailed_it/config/font_system.dart';
import 'package:nailed_it/view/base/base_screen.dart';
import 'package:nailed_it/view_model/nursery/nursery_view_model.dart';
import 'package:nailed_it/widget/appbar/default_back_appbar.dart';

class NurseryScreen extends BaseScreen<NurseryViewModel> {
  const NurseryScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(72),
      child: DefaultBackAppBar(
        title: '양식장 ${viewModel.nurseryId} 상세',
        onBackPress: () => Get.back(),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: (Get.width - 48) / 2,
              height: (Get.width - 48) / 2,
              margin: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
              decoration: BoxDecoration(
                color: ColorSystem.white,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '용존 산소',
                      style: FontSystem.KR36EB,
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => Text(
                        '${viewModel.nurseryDetailState.dissolvedOxygen}',
                        style: FontSystem.KR32B,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: (Get.width - 48) / 2,
              height: (Get.width - 48) / 2,
              margin: const EdgeInsets.only(top: 8, right: 16, bottom: 8),
              decoration: BoxDecoration(
                color: ColorSystem.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '암모니아',
                      style: FontSystem.KR36EB,
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => Text(
                        '${viewModel.nurseryDetailState.ammonia}',
                        style: FontSystem.KR32B,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: (Get.width - 48) / 2,
              height: (Get.width - 48) / 2,
              margin: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
              decoration: BoxDecoration(
                color: ColorSystem.white,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '산도',
                      style: FontSystem.KR36EB,
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => Text(
                        '${viewModel.nurseryDetailState.acidity}',
                        style: FontSystem.KR32B,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: (Get.width - 48) / 2,
              height: (Get.width - 48) / 2,
              margin: const EdgeInsets.only(top: 8, right: 16, bottom: 8),
              decoration: BoxDecoration(
                color: ColorSystem.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '염도',
                      style: FontSystem.KR36EB,
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => Text(
                        '${viewModel.nurseryDetailState.salinity}',
                        style: FontSystem.KR32B,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: (Get.width - 48) / 2,
              height: (Get.width - 48) / 2,
              margin: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
              decoration: BoxDecoration(
                color: ColorSystem.white,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '탁도',
                      style: FontSystem.KR36EB,
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => Text(
                        '${viewModel.nurseryDetailState.turbidity}',
                        style: FontSystem.KR32B,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
