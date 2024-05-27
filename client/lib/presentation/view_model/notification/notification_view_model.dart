import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nailed_it/core/entity/date_time_pagination.dart';
import 'package:nailed_it/domain/entity/notification/notification_state.dart';
import 'package:nailed_it/domain/repository/notification/notification_repository.dart';
import 'package:nailed_it/domain/usecase/notification/read_notification_last_updated_at_use_case.dart';
import 'package:nailed_it/domain/usecase/notification/read_notifications_use_case.dart';
import 'package:nailed_it/domain/usecase/notification/update_is_read_use_case.dart';

class NotificationViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ReadNotificationUpdatedAtUseCase _readNotificationUpdatedAtUseCase;
  late final ReadNotificationsUseCase _readNotificationsUseCase;
  late final UpdateIsReadUseCase _updateIsReadUseCase;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<DateTimePagination> _pagination;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  late final PagingController<String, Rx<NotificationState>> pagingController;

  DateTimePagination get pagination => _pagination.value;

  @override
  void onInit() {
    super.onInit();

    _readNotificationUpdatedAtUseCase = ReadNotificationUpdatedAtUseCase(
      notificationHistoryRepository: Get.find<NotificationRepository>(),
    );
    _readNotificationsUseCase = ReadNotificationsUseCase(
      notificationHistoryRepository: Get.find<NotificationRepository>(),
    );
    _updateIsReadUseCase = UpdateIsReadUseCase(
      notificationHistoryRepository: Get.find<NotificationRepository>(),
    );

    _pagination = DateTimePagination.initial().obs;

    pagingController = PagingController<String, Rx<NotificationState>>(
      firstPageKey: '',
    );

    pagingController.addPageRequestListener((pageKey) {
      _fetchNotifications();
    });
  }

  @override
  void onClose() {
    super.onClose();

    pagingController.dispose();
  }

  void fetchPagination() async {
    _pagination.value = DateTimePagination(
      updatedAt: DateTime.now(),
      lastDocId: '',
      size: 10,
    );

    pagingController.refresh();
  }

  Future<void> _fetchNotifications() async {
    List<NotificationState> readNotifications =
        await _readNotificationsUseCase.execute(
      _pagination.value,
    );

    _pagination.value = _pagination.value.copyWith(
      lastDocId: readNotifications.isNotEmpty ? readNotifications.last.id : '',
    );

    bool isLastPage = readNotifications.length < _pagination.value.size;

    if (isLastPage) {
      pagingController
          .appendLastPage(readNotifications.map((e) => e.obs).toList());
    } else {
      pagingController.appendPage(
        readNotifications.map((e) => e.obs).toList(),
        _pagination.value.lastDocId,
      );
    }
  }

  void fetchIsRead(int index) async {
    await _updateIsReadUseCase.execute(
      pagingController.itemList![index].value.id,
    );

    pagingController.itemList![index].value =
        pagingController.itemList![index].value.copyWith(
      isRead: true,
    );
  }
}
