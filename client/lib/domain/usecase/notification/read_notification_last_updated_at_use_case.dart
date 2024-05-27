import 'package:nailed_it/core/usecase/no_param_usecase.dart';
import 'package:nailed_it/domain/repository/notification/notification_repository.dart';

class ReadNotificationUpdatedAtUseCase extends NoParamUseCase<DateTime> {
  ReadNotificationUpdatedAtUseCase({
    required NotificationRepository notificationHistoryRepository,
  }) : _notificationHistoryRepository = notificationHistoryRepository;

  final NotificationRepository _notificationHistoryRepository;

  @override
  Future<DateTime> execute() async {
    return (await _notificationHistoryRepository.readLastUpdateAt()).add(
      const Duration(seconds: 5),
    );
  }
}
