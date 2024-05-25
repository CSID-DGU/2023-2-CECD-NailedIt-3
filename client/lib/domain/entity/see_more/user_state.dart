class UserState {
  final String id;
  final String nickname;
  final bool isAllowedNotification;

  UserState({
    required this.id,
    required this.nickname,
    required this.isAllowedNotification,
  });

  UserState copyWith({
    String? id,
    String? nickname,
    bool? isAllowedNotification,
  }) {
    return UserState(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      isAllowedNotification:
          isAllowedNotification ?? this.isAllowedNotification,
    );
  }

  factory UserState.initial() {
    return UserState(
      id: '',
      nickname: '',
      isAllowedNotification: false,
    );
  }

  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(
      id: json['id'],
      nickname: json['nickname'],
      isAllowedNotification: json['is_allowed_notification'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'is_allowed_notification': isAllowedNotification,
    };
  }

  @override
  String toString() {
    return 'UserState'
        'id: $id'
        'nickname: $nickname'
        'isAllowedNotification: $isAllowedNotification';
  }
}
