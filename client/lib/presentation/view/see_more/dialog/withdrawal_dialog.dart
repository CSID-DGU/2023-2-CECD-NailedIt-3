import 'package:flutter/material.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/config/font_system.dart';
import 'package:nailed_it/presentation/widget/button/rounded_rectangle_text_button.dart';

class WithdrawalDialog extends StatelessWidget {
  const WithdrawalDialog({
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
              '회원탈퇴 하시겠습니까?\n탈퇴 후에는 복구가 불가능합니다',
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
                    backgroundColor: ColorSystem.error,
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
