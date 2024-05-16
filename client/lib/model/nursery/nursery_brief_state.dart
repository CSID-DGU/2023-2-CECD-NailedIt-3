class NurseryBriefState {
  final int id;
  final double dissolvedOxygen;

  const NurseryBriefState({
    required this.id,
    required this.dissolvedOxygen,
  });

  NurseryBriefState copyWith({
    int? id,
    double? dissolvedOxygen,
  }) {
    return NurseryBriefState(
      id: id ?? this.id,
      dissolvedOxygen: dissolvedOxygen ?? this.dissolvedOxygen,
    );
  }

  factory NurseryBriefState.fromJson(Map<String, dynamic> json) {
    return NurseryBriefState(
      id: json['id'] as int,
      dissolvedOxygen: json['dissolvedOxygen'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dissolvedOxygen': dissolvedOxygen,
    };
  }
}
