import 'package:drift/drift.dart';

class NotificationHistory extends Table {
  IntColumn get id => integer().autoIncrement().named('id')();

  TextColumn get content => text().named('content')();

  BoolColumn get isRead => boolean().named('is_read')();

  DateTimeColumn get createdAt => dateTime().named('created_at')();
}
