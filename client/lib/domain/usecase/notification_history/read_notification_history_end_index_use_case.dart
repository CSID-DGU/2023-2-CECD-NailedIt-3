import 'package:nailed_it/core/usecase/no_param_usecase.dart';
import 'package:nailed_it/domain/repository/notification_history/notification_history_repository.dart';

class ReadNotificationHistoryEndIndexUseCase extends NoParamUseCase<int> {
  ReadNotificationHistoryEndIndexUseCase({
    required NotificationHistoryRepository notificationHistoryRepository,
  }) : _notificationHistoryRepository = notificationHistoryRepository;

  final NotificationHistoryRepository _notificationHistoryRepository;

  @override
  Future<int> execute() async {
    return await _notificationHistoryRepository
        .readNotificationHistoryEndIndex();
  }
}
