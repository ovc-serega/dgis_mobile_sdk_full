import 'package:flutter/widgets.dart';

@immutable
class DashboardModel {
  final int distance;
  final int duration;
  final bool soundsEnabled;

  const DashboardModel({
    required this.distance,
    required this.duration,
    required this.soundsEnabled,
  });

  DashboardModel copyWith({
    int? distance,
    int? duration,
    bool? soundsEnabled,
  }) {
    return DashboardModel(
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      soundsEnabled: soundsEnabled ?? this.soundsEnabled,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DashboardModel &&
        other.distance == distance &&
        other.duration == duration &&
        other.soundsEnabled == soundsEnabled;
  }

  @override
  int get hashCode => Object.hash(
        distance,
        duration,
        soundsEnabled,
      );

  @override
  String toString() => 'DashboardModel('
      'distance: $distance, '
      'duration: $duration, '
      'soundsEnabled: $soundsEnabled'
      ')';
}
