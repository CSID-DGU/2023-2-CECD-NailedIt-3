import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/app/config/app_routes.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/config/font_system.dart';
import 'package:nailed_it/core/view/base_widget.dart';
import 'package:nailed_it/presentation/view/see_more/dialog/logout_dialog.dart';
import 'package:nailed_it/presentation/view/see_more/dialog/withdrawal_dialog.dart';
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
          Get.dialog(
            LogoutDialog(
              onConfirm: () {
                viewModel.logout().then((value) {
                  if (value) {
                    _showSnackBar(
                      '로그아웃 성공',
                      '로그아웃 되었습니다.',
                    );
                    Get.offAllNamed(AppRoutes.LOGIN);
                  } else {
                    _showSnackBar(
                      '로그아웃 실패',
                      '알 수 없는 이유로 로그아웃에 실패했습니다. 재시도해주세요.',
                    );
                  }
                });
              },
              onCancel: () {
                Get.back();
              },
            ),
          );
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
          Get.dialog(
            WithdrawalDialog(
              onConfirm: () {
                viewModel.withdrawal().then((value) {
                  if (value) {
                    _showSnackBar(
                      '회원탈퇴 성공',
                      '회원탈퇴 되었습니다.',
                    );
                    Get.offAllNamed(AppRoutes.LOGIN);
                  } else {
                    _showSnackBar(
                      '회원탈퇴 실패',
                      '알 수 없는 이유로 회원탈퇴에 실패했습니다. 재시도해주세요.',
                    );
                  }
                });
              },
              onCancel: () {
                Get.back();
              },
            ),
          );
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

  void _showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      duration: const Duration(seconds: 2),
      backgroundColor: ColorSystem.neutral.withOpacity(0.3),
    );
  }
}
