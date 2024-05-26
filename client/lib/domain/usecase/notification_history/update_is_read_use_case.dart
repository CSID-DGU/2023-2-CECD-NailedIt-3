import 'package:nailed_it/core/usecase/param_usecase.dart';
import 'package:nailed_it/domain/repository/notification_history/notification_history_repository.dart';

class UpdateIsReadUseCase extends ParamUseCase<void, int> {
  UpdateIsReadUseCase({
    required NotificationHistoryRepository notificationHistoryRepository,
  }) : _notificationHistoryRepository = notificationHistoryRepository;

  final NotificationHistoryRepository _notificationHistoryRepository;

  @override
  Future<void> execute(int params) async {
    try {
      await _notificationHistoryRepository.updateIsReadById(params);
    } catch (_) {}
  }
}
