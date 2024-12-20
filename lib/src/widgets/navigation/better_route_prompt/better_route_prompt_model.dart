import 'package:flutter/foundation.dart';

enum BetterRouteType { winnigTime, losingTime, sameTime, unspecified }

@immutable
class BetterRoutePromptModel {
  final int? timeWinning;
  final BetterRouteType type;

  const BetterRoutePromptModel({required this.timeWinning, required this.type});

  BetterRoutePromptModel copyWith({
    int? Function()? timeWinning,
    BetterRouteType? type,
  }) {
    return BetterRoutePromptModel(
      timeWinning: timeWinning != null ? timeWinning() : this.timeWinning,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BetterRoutePromptModel &&
        other.timeWinning == timeWinning &&
        other.type == type;
  }

  @override
  int get hashCode => Object.hash(timeWinning, type);

  @override
  String toString() =>
      'BetterRoutePromptModel(timeWinning: $timeWinning, type: $type)';
}
