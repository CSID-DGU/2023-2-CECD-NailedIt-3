class NurseryDetailState {
  final double dissolvedOxygen;
  final double ammonia;
  final double acidity;
  final double salinity;
  final double turbidity;

  const NurseryDetailState({
    required this.dissolvedOxygen,
    required this.ammonia,
    required this.acidity,
    required this.salinity,
    required this.turbidity,
  });

  NurseryDetailState copyWith({
    double? dissolvedOxygen,
    double? ammonia,
    double? acidity,
    double? salinity,
    double? turbidity,
  }) {
    return NurseryDetailState(
      dissolvedOxygen: dissolvedOxygen ?? this.dissolvedOxygen,
      ammonia: ammonia ?? this.ammonia,
      acidity: acidity ?? this.acidity,
      salinity: salinity ?? this.salinity,
      turbidity: turbidity ?? this.turbidity,
    );
  }

  factory NurseryDetailState.fromJson(Map<String, dynamic> json) {
    return NurseryDetailState(
      dissolvedOxygen: json['dissolvedOxygen'],
      ammonia: json['ammonia'],
      acidity: json['acidity'],
      salinity: json['salinity'],
      turbidity: json['turbidity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dissolvedOxygen': dissolvedOxygen,
      'ammonia': ammonia,
      'acidity': acidity,
      'salinity': salinity,
      'turbidity': turbidity,
    };
  }
}
