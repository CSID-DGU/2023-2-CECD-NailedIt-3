import 'package:get/get.dart';
import 'package:nailed_it/core/entity/index_pagination.dart';
import 'package:nailed_it/domain/entity/notification/notification_history_state.dart';
import 'package:nailed_it/domain/repository/notification_history/notification_history_repository.dart';
import 'package:nailed_it/domain/usecase/notification_history/read_notification_histories_use_case.dart';
import 'package:nailed_it/domain/usecase/notification_history/read_notification_history_end_index_use_case.dart';
import 'package:nailed_it/domain/usecase/notification_history/update_is_read_use_case.dart';

class NotificationViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final ReadNotificationHistoryEndIndexUseCase
      _readNotificationHistoryEndIndexUseCase;
  late final ReadNotificationHistoriesUseCase _readNotificationHistoriesUseCase;
  late final UpdateIsReadUseCase _updateIsReadUseCase;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late IndexPagination _pagination;
  late final RxBool _isLoading;
  late final RxList<NotificationHistoryState> _notificationHistories;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<NotificationHistoryState> get notificationHistories =>
      _notificationHistories;

  @override
  void onInit() {
    super.onInit();

    _readNotificationHistoryEndIndexUseCase =
        ReadNotificationHistoryEndIndexUseCase(
      notificationHistoryRepository: Get.find<NotificationHistoryRepository>(),
    );
    _readNotificationHistoriesUseCase = ReadNotificationHistoriesUseCase(
      notificationHistoryRepository: Get.find<NotificationHistoryRepository>(),
    );
    _updateIsReadUseCase = UpdateIsReadUseCase(
      notificationHistoryRepository: Get.find<NotificationHistoryRepository>(),
    );

    _pagination = IndexPagination.initial();
    _notificationHistories = <NotificationHistoryState>[].obs;

    fetchIndexInPagination();
  }

  void fetchIndexInPagination() async {
    int endIndex = await _readNotificationHistoryEndIndexUseCase.execute();

    _pagination = IndexPagination(
      index: endIndex,
      page: -1,
      size: 10,
    );

    await fetchNotificationHistories(true);
  }

  Future<void> fetchNotificationHistories(bool isHardRefresh) async {
    _pagination = _pagination.copyWith(
      page: _pagination.page + 1,
    );

    List<NotificationHistoryState> readNotificationHistories =
        await _readNotificationHistoriesUseCase.execute(
      _pagination,
    );

    if (isHardRefresh) {
      _notificationHistories.clear();
    }

    _notificationHistories.addAll(readNotificationHistories);
  }

  void fetchIsRead(int index) async {
    await _updateIsReadUseCase.execute(
      _notificationHistories[index].id,
    );

    _notificationHistories[index] = _notificationHistories[index].copyWith(
      isRead: true,
    );
  }
}
