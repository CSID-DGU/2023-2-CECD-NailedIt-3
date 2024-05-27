class DateTimePagination {
  final DateTime updatedAt;
  final String lastDocId;
  final int size;

  DateTimePagination({
    required this.updatedAt,
    required this.lastDocId,
    required this.size,
  });

  DateTimePagination copyWith({
    DateTime? updatedAt,
    String? lastDocId,
    int? size,
  }) {
    return DateTimePagination(
      updatedAt: updatedAt ?? this.updatedAt,
      lastDocId: lastDocId ?? this.lastDocId,
      size: size ?? this.size,
    );
  }

  factory DateTimePagination.initial() {
    return DateTimePagination(
      updatedAt: DateTime.now(),
      lastDocId: '',
      size: 10,
    );
  }

  factory DateTimePagination.fromJson(Map<String, dynamic> json) {
    return DateTimePagination(
      updatedAt: DateTime.parse(json['updated_at']),
      lastDocId: json['last_doc_id'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'updated_at': updatedAt.toIso8601String(),
      'last_doc_id': lastDocId,
      'size': size,
    };
  }
}
