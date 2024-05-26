import 'package:get/get.dart';
import 'package:nailed_it/core/entity/pagination.dart';
import 'package:nailed_it/domain/entity/notification/notification_history_state.dart';
import 'package:nailed_it/domain/usecase/notification_history/read_notification_histories_use_case.dart';

class NotificationViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ReadNotificationHistoriesUseCase _readNotificationHistoriesUseCase;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxBool _isLoading;
  late final Pagination _pagination;
  late final RxList<NotificationHistoryState> _notificationHistories;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<NotificationHistoryState> get notificationHistories =>
      _notificationHistories;

  @override
  void onInit() {
    super.onInit();

    _readNotificationHistoriesUseCase = ReadNotificationHistoriesUseCase();

    _pagination = Pagination.initial();
    _notificationHistories = <NotificationHistoryState>[].obs;

    fetchNotificationHistories();
  }

  void fetchNotificationHistories() async {
    _pagination.nextPage();
    _notificationHistories.addAll(
      await _readNotificationHistoriesUseCase.execute(
        _pagination,
      ),
    );
  }

  void fetchIsRead(int index) {
    _notificationHistories[index] = _notificationHistories[index].copyWith(
      isRead: true,
    );
  }
}
