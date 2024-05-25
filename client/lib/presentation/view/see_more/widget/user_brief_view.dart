import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/config/font_system.dart';
import 'package:nailed_it/core/view/base_widget.dart';
import 'package:nailed_it/presentation/view_model/see_more/see_more_view_model.dart';

class UserBriefView extends BaseWidget<SeeMoreViewModel> {
  const UserBriefView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      color: ColorSystem.primary.shade100,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 36,
      ),
      width: Get.width,
      child: Column(
        children: [
          _nicknameView(),
          _idView(),
        ],
      ),
    );
  }

  Widget _nicknameView() {
    return Obx(
      () => Text(
        viewModel.user.nickname,
        style: FontSystem.H3,
      ),
    );
  }

  Widget _idView() {
    return Obx(
      () => Text(
        "#${viewModel.user.id.substring(0, 5)}",
        style: FontSystem.Sub2.copyWith(
          color: ColorSystem.neutral.shade600,
        ),
      ),
    );
  }
}
