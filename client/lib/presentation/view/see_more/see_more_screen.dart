import 'package:flutter/material.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/core/view/base_screen.dart';
import 'package:nailed_it/presentation/view/see_more/widget/setting_view.dart';
import 'package:nailed_it/presentation/view/see_more/widget/user_brief_view.dart';
import 'package:nailed_it/presentation/view_model/see_more/see_more_view_model.dart';
import 'package:nailed_it/presentation/widget/appbar/default_appbar.dart';

class SeeMoreScreen extends BaseScreen<SeeMoreViewModel> {
  const SeeMoreScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: DefaultAppBar(
        title: '더보기',
        decoration: BoxDecoration(
          color: ColorSystem.neutral.shade50,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xFFE5E5E5),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Column(
      children: [
        UserBriefView(),
        SettingView(),
      ],
    );
  }
}
