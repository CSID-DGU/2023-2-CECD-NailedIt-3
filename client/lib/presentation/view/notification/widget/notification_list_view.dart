import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nailed_it/core/view/base_widget.dart';
import 'package:nailed_it/domain/entity/notification/notification_state.dart';
import 'package:nailed_it/presentation/view/notification/widget/notification_item.dart';
import 'package:nailed_it/presentation/view_model/notification/notification_view_model.dart';

class NotificationListView extends BaseWidget<NotificationViewModel> {
  const NotificationListView({super.key});

  @override
  Widget buildView(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        viewModel.fetchPagination();
      },
      child: PagedListView<String, Rx<NotificationState>>(
        pagingController: viewModel.pagingController,
        builderDelegate: PagedChildBuilderDelegate<Rx<NotificationState>>(
          itemBuilder: (context, state, index) {
            return Obx(
              () => NotificationItem(
                state: state.value,
                onTap: () {
                  viewModel.fetchIsRead(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
