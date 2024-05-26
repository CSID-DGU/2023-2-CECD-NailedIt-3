import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/core/view/base_widget.dart';
import 'package:nailed_it/presentation/view_model/login/login_view_model.dart';

class OverlayGreyBarrier extends BaseWidget<LoginViewModel> {
  const OverlayGreyBarrier({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => IgnorePointer(
        ignoring: !viewModel.isEnableGreyBarrier,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: viewModel.isEnableGreyBarrier
              ? Colors.black.withOpacity(0.5)
              : Colors.transparent,
        ),
      ),
    );
  }
}
