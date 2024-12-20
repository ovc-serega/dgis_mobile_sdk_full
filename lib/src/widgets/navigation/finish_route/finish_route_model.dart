import 'package:flutter/widgets.dart';

@immutable
class FinishRouteModel {
  final bool isParkingEnabled;

  const FinishRouteModel({required this.isParkingEnabled});

  FinishRouteModel copyWith({bool? isParkingEnabled}) {
    return FinishRouteModel(
      isParkingEnabled: isParkingEnabled ?? this.isParkingEnabled,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FinishRouteModel &&
        other.isParkingEnabled == isParkingEnabled;
  }

  @override
  int get hashCode => isParkingEnabled.hashCode;

  @override
  String toString() => 'FinishRouteModel(isParkingEnabled: $isParkingEnabled)';
}
