import 'package:flutter/foundation.dart';
import '../../../generated/dart_bindings.dart' as sdk;

@immutable
class TrafficLineModel {
  final double? routePosition;
  final double routeLength;
  final double routeProgress;

  final List<sdk.GeoPointRouteEntry> intermediatePoints;
  final List<sdk.TrafficSpeedColorRouteLongEntry> speedColors;
  final List<sdk.RoadEventRouteEntry> roadEvents;

  const TrafficLineModel({
    required this.routeLength,
    required this.routeProgress,
    required this.routePosition,
    required this.intermediatePoints,
    required this.speedColors,
    required this.roadEvents,
  });
  TrafficLineModel copyWith({
    double? routeProgress,
    double? Function()? routePosition,
    double? routeLength,
    List<sdk.GeoPointRouteEntry>? intermediatePoints,
    List<sdk.TrafficSpeedColorRouteLongEntry>? speedColors,
    List<sdk.RoadEventRouteEntry>? roadEvents,
  }) {
    return TrafficLineModel(
      routeLength: routeLength ?? this.routeLength,
      routeProgress: routeProgress ?? this.routeProgress,
      routePosition:
          routePosition != null ? routePosition() : this.routePosition,
      intermediatePoints: intermediatePoints ?? this.intermediatePoints,
      speedColors: speedColors ?? this.speedColors,
      roadEvents: roadEvents ?? this.roadEvents,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrafficLineModel &&
        other.routePosition == routePosition &&
        other.routeLength == routeLength &&
        other.routeProgress == routeProgress &&
        listEquals(other.intermediatePoints, intermediatePoints) &&
        listEquals(other.speedColors, speedColors) &&
        listEquals(other.roadEvents, roadEvents);
  }

  @override
  int get hashCode => Object.hash(
        routePosition,
        routeProgress,
        routeLength,
        Object.hashAll(intermediatePoints),
        Object.hashAll(speedColors),
        Object.hashAll(roadEvents),
      );

  @override
  String toString() => 'TrafficLineModel('
      'routePosition: $routePosition, '
      'intermediatePoints: ${intermediatePoints.length} points, '
      'speedColors: ${speedColors.length} colors, '
      'roadEvents: ${roadEvents.length} events, '
      'routeLength: $routeLength, '
      'routeProgress: $routeProgress '
      ')';
}
