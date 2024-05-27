import 'package:flutter/material.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/config/font_system.dart';
import 'package:nailed_it/presentation/widget/button/rounded_rectangle_text_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  final Function() onConfirm;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '로그아웃 하시겠습니까?',
              style: FontSystem.H2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: RoundedRectangleTextButton(
                    text: '취소',
                    textStyle: FontSystem.H5.copyWith(
                      color: ColorSystem.neutral.shade500,
                      height: 1,
                    ),
                    height: 50,
                    backgroundColor: ColorSystem.white,
                    foregroundColor: ColorSystem.neutral.shade200,
                    borderSide: BorderSide(
                      color: ColorSystem.neutral.shade200,
                    ),
                    onPressed: onCancel,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RoundedRectangleTextButton(
                    text: '확인',
                    textStyle: FontSystem.H5.copyWith(
                      color: ColorSystem.white,
                      height: 1,
                    ),
                    height: 50,
                    backgroundColor: ColorSystem.primary,
                    foregroundColor: ColorSystem.white,
                    onPressed: onConfirm,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
