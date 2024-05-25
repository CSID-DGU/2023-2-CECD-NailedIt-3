import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/config/font_system.dart';
import 'package:nailed_it/app/utility/log_util.dart';
import 'package:nailed_it/core/view/base_widget.dart';
import 'package:nailed_it/presentation/view_model/see_more/see_more_view_model.dart';
import 'package:nailed_it/presentation/widget/line/infinity_horizon_line.dart';

class SettingView extends BaseWidget<SeeMoreViewModel> {
  const SettingView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Column(
      children: [
        _notificationSection(),
        InfinityHorizonLine(
          height: 1,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: ColorSystem.neutral.shade100,
        ),
        _logoutView(),
        InfinityHorizonLine(
          height: 1,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: ColorSystem.neutral.shade100,
        ),
        _withdrawalView(),
      ],
    );
  }

  Widget _notificationSection() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "알림 설정",
              style: FontSystem.Sub2,
            ),
            const Spacer(),
            SizedBox(
              width: 44,
              height: 24,
              child: Obx(
                () => Switch(
                  value: viewModel.user.isAllowedNotification,
                  onChanged: (value) {
                    viewModel.fetchAllowedNotification(
                      allowedNotification: value,
                    );
                  },
                  activeColor: ColorSystem.white,
                  activeTrackColor: ColorSystem.primary.shade200,
                  inactiveThumbColor: ColorSystem.white,
                  inactiveTrackColor: ColorSystem.neutral.shade200,
                  trackOutlineColor: MaterialStateProperty.all(
                    ColorSystem.transparent,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _logoutView() => InkWell(
        onTap: () {
          LogUtil.info("Logout");
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Text(
            "로그아웃",
            style: FontSystem.Sub2.copyWith(
              color: ColorSystem.primary.shade500,
            ),
          ),
        ),
      );

  Widget _withdrawalView() => InkWell(
        onTap: () {
          LogUtil.info("Withdrawal");
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Text(
            "회원탈퇴",
            style: FontSystem.Sub2.copyWith(
              color: ColorSystem.error.shade500,
            ),
          ),
        ),
      );
}
