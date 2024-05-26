import 'package:intl/intl.dart';

class NotificationHistoryState {
  final int id;
  final String content;
  final String createdAt;
  final bool isRead;

  NotificationHistoryState({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.isRead,
  });

  NotificationHistoryState copyWith({
    int? id,
    String? content,
    String? createdAt,
    bool? isRead,
  }) {
    return NotificationHistoryState(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }

  factory NotificationHistoryState.initial() {
    return NotificationHistoryState(
      id: 0,
      content: '',
      createdAt: '',
      isRead: false,
    );
  }

  factory NotificationHistoryState.fromJson(Map<String, dynamic> json) {
    DateTime createAt = DateTime.fromMillisecondsSinceEpoch(json['createdAt']);

    return NotificationHistoryState(
      id: json['id'],
      content: json['content'],
      createdAt: DateFormat('yyyy-MM-dd HH:mm').format(createAt),
      isRead: json['isRead'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'created_at': createdAt,
      'is_read': isRead,
    };
  }

  @override
  String toString() {
    return 'NotificationHistoryState'
        'id: $id'
        'content: $content'
        'createdAt: $createdAt'
        'isRead: $isRead';
  }
}
