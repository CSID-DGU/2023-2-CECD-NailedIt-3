import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nailed_it/app/config/app_routes.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/config/font_system.dart';
import 'package:nailed_it/presentation/view/login/widget/overlay_grey_barrier.dart';
import 'package:nailed_it/presentation/view_model/login/login_view_model.dart';

class LoginScreen extends GetView<LoginViewModel> {
  const LoginScreen({super.key});

  LoginViewModel get viewModel => controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorSystem.white,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Nailed It',
                    style: FontSystem.H1.copyWith(
                      fontSize: 48.0,
                    ),
                  ),
                ),
                const SizedBox(height: 160.0),
                GestureDetector(
                  onTap: _onPressedSignInButton,
                  child: SvgPicture.asset(
                    'assets/images/neutral_rd_ctn.svg',
                    width: Get.width * 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),
        const OverlayGreyBarrier(),
      ],
    );
  }

  void _onPressedSignInButton() {
    viewModel.loginWithGoogle().then((value) {
      if (value) {
        _showSnackBar(
          '로그인에 성공했습니다.',
          '양식장의 알림을 받아보세요!',
        );
        Get.offAndToNamed(AppRoutes.ROOT);
      } else {
        _showSnackBar(
          '로그인에 실패했습니다.',
          '알 수 없는 이유로 로그인에 실패했습니다.',
        );
      }
    });
  }

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
