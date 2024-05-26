import 'package:nailed_it/core/entity/index_pagination.dart';
import 'package:nailed_it/core/usecase/param_usecase.dart';
import 'package:nailed_it/domain/entity/notification/notification_history_state.dart';
import 'package:nailed_it/domain/repository/notification_history/notification_history_repository.dart';

class ReadNotificationHistoriesUseCase
    extends ParamUseCase<List<NotificationHistoryState>, IndexPagination> {
  ReadNotificationHistoriesUseCase({
    required NotificationHistoryRepository notificationHistoryRepository,
  }) : _notificationHistoryRepository = notificationHistoryRepository;

  final NotificationHistoryRepository _notificationHistoryRepository;

  @override
  Future<List<NotificationHistoryState>> execute(IndexPagination params) async {
    return await _notificationHistoryRepository.readNotificationHistories(
      params.index,
      params.page,
      params.size,
    );
  }
}
