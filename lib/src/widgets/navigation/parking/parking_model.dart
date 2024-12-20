import 'package:flutter/foundation.dart';

@immutable
class ParkingModel {
  final bool isActive;

  const ParkingModel({required this.isActive});

  ParkingModel copyWith({bool? isActive}) {
    return ParkingModel(
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ParkingModel && other.isActive == isActive;
  }

  @override
  int get hashCode => isActive.hashCode;

  @override
  String toString() => 'ParkingModel(isActive: $isActive)';
}
