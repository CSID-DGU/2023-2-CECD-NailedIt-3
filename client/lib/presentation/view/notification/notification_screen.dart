import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/config/font_system.dart';
import 'package:nailed_it/core/view/base_screen.dart';
import 'package:nailed_it/presentation/view/notification/widget/notification_list_view.dart';
import 'package:nailed_it/presentation/view_model/notification/notification_view_model.dart';
import 'package:nailed_it/presentation/widget/appbar/default_appbar.dart';

class NotificationScreen extends BaseScreen<NotificationViewModel> {
  const NotificationScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
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
        actions: [
          Obx(
            () => Text(
              DateFormat('yyyy-MM-dd hh:mm')
                  .format(viewModel.pagination.updatedAt),
              style: FontSystem.H5.copyWith(
                color: ColorSystem.neutral.shade800,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const NotificationListView();
  }
}
