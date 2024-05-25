import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/core/view/base_widget.dart';
import 'package:nailed_it/presentation/view/notification/widget/notification_history_item.dart';
import 'package:nailed_it/presentation/view_model/notification/notification_view_model.dart';

class NotificationHistoryListView extends BaseWidget<NotificationViewModel> {
  const NotificationHistoryListView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: viewModel.notificationHistories.length,
        itemBuilder: (BuildContext context, int index) {
          return NotificationHistoryItem(
            state: viewModel.notificationHistories[index],
            onTap: () {
              if (!viewModel.notificationHistories[index].isRead) {
                viewModel.fetchIsRead(index);
              }
            },
          );
        },
      ),
    );
  }
}
