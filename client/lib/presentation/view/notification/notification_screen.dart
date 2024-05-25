import 'package:flutter/material.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/core/view/base_screen.dart';
import 'package:nailed_it/presentation/view_model/notification/notification_view_model.dart';
import 'package:nailed_it/presentation/widget/appbar/default_appbar.dart';

class NotificationScreen extends BaseScreen<NotificationViewModel> {
  const NotificationScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: DefaultAppBar(
        title: '알림',
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
    return const Center(
      child: Text('Notification Screen'),
    );
  }
}
