import 'package:flutter/widgets.dart';

@immutable
class CompassModel {
  final double bearing;

  const CompassModel({required this.bearing});

  CompassModel copyWith({double? bearing}) {
    return CompassModel(bearing: bearing ?? this.bearing);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompassModel && other.bearing == bearing;
  }

  @override
  int get hashCode => bearing.hashCode;

  @override
  String toString() => 'CompassModel(bearing: $bearing)';
}
