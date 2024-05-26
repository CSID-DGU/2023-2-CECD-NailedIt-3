import 'package:drift/drift.dart';
import 'package:nailed_it/app/config/local_database_config.dart';
import 'package:nailed_it/data/model/notification_history/notification_history.dart';
import 'package:nailed_it/data/provider/notification_history/notification_history_local_provider.dart';

part 'notification_history_local_provider_impl.g.dart';

@DriftAccessor(tables: [NotificationHistory])
class NotificationHistoryLocalProviderImpl
    extends DatabaseAccessor<LocalDatabase>
    with _$NotificationHistoryLocalProviderImplMixin
    implements NotificationHistoryLocalProvider {
  NotificationHistoryLocalProviderImpl(super.db);

  @override
  Future<NotificationHistoryData> save(
    NotificationHistoryCompanion entity,
  ) async {
    int index = await into(notificationHistory).insert(entity);

    return NotificationHistoryData(
      id: index,
      content: entity.content.value,
      isRead: entity.isRead.value,
      createdAt: entity.createdAt.value,
    );
  }

  @override
  Future<void> updateIsReadByData(
    NotificationHistoryData entity,
    bool isRead,
  ) async {
    await (update(notificationHistory)..where((t) => t.id.equals(entity.id)))
        .write(NotificationHistoryCompanion(isRead: Value(isRead)));
  }

  @override
  Future<int> findEndIndex() async {
    NotificationHistoryData? data = await (select(notificationHistory)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
          ..limit(1))
        .getSingleOrNull();

    return data?.id ?? 0;
  }

  @override
  Future<List<NotificationHistoryData>> findAllBySmallerOrEqual(
      int index, int page, int size) async {
    return await (select(notificationHistory)
          ..where((t) => t.id.isSmallerOrEqualValue(index))
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
          ..limit(size, offset: page))
        .get();
  }
}
