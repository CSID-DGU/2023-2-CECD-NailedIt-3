import 'package:nailed_it/core/entity/date_time_pagination.dart';
import 'package:nailed_it/core/usecase/param_usecase.dart';
import 'package:nailed_it/domain/entity/notification/notification_state.dart';
import 'package:nailed_it/domain/repository/notification_history/notification_repository.dart';

class ReadNotificationsUseCase
    extends ParamUseCase<List<NotificationState>, DateTimePagination> {
  ReadNotificationsUseCase({
    required NotificationRepository notificationHistoryRepository,
  }) : _notificationHistoryRepository = notificationHistoryRepository;

  final NotificationRepository _notificationHistoryRepository;

  @override
  Future<List<NotificationState>> execute(
    DateTimePagination params,
  ) async {
    return await _notificationHistoryRepository.readNotifications(
      params.updatedAt,
      params.lastDocId,
      params.size,
    );
  }
}
