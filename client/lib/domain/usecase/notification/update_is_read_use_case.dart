import 'package:nailed_it/core/usecase/param_usecase.dart';
import 'package:nailed_it/domain/repository/notification/notification_repository.dart';

class UpdateIsReadUseCase extends ParamUseCase<void, String> {
  UpdateIsReadUseCase({
    required NotificationRepository notificationHistoryRepository,
  }) : _notificationHistoryRepository = notificationHistoryRepository;

  final NotificationRepository _notificationHistoryRepository;

  @override
  Future<void> execute(String params) async {
    try {
      await _notificationHistoryRepository.updateIsReadById(params);
    } catch (_) {}
  }
}
