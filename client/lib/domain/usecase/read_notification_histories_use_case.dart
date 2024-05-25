import 'package:nailed_it/core/entity/pagination.dart';
import 'package:nailed_it/core/usecase/param_usecase.dart';
import 'package:nailed_it/domain/entity/notification/notification_history_state.dart';

class ReadNotificationHistoriesUseCase
    extends ParamUseCase<List<NotificationHistoryState>, Pagination> {
  ReadNotificationHistoriesUseCase();

  @override
  Future<List<NotificationHistoryState>> execute(Pagination params) async {
    await Future.delayed(const Duration(seconds: 3));

    return Future(
      () => [
        NotificationHistoryState(
          id: 10,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: false,
        ),
        NotificationHistoryState(
          id: 9,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: false,
        ),
        NotificationHistoryState(
          id: 8,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: false,
        ),
        NotificationHistoryState(
          id: 7,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: false,
        ),
        NotificationHistoryState(
          id: 6,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: false,
        ),
        NotificationHistoryState(
          id: 5,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: false,
        ),
        NotificationHistoryState(
          id: 4,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: false,
        ),
        NotificationHistoryState(
          id: 3,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: false,
        ),
        NotificationHistoryState(
          id: 2,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: true,
        ),
        NotificationHistoryState(
          id: 1,
          content: 'Subtitle 1',
          createdAt: "2024-05-01 00:00:00",
          isRead: true,
        ),
      ],
    );
  }
}
