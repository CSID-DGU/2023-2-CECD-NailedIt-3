import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class NotificationState {
  final String id;
  final String content;
  final String createdAt;
  final bool isRead;

  NotificationState({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.isRead,
  });

  NotificationState copyWith({
    String? id,
    String? content,
    String? createdAt,
    bool? isRead,
  }) {
    return NotificationState(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }

  factory NotificationState.initial() {
    return NotificationState(
      id: '',
      content: '',
      createdAt: '',
      isRead: false,
    );
  }

  factory NotificationState.fromJson(Map<String, dynamic> json) {
    Timestamp createAt = json['created_at'];

    return NotificationState(
      id: json['id'],
      content: json['content'],
      createdAt: DateFormat('yyyy-MM-dd HH:mm').format(createAt.toDate()),
      isRead: json['is_read'],
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationState && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
