import 'package:flutter/widgets.dart';

import '../../common/dgis_color_scheme.dart';
import '../../map/map_widget_color_scheme.dart';

class CameraProgressTheme extends MapWidgetColorScheme {
  final Color surfaceColor;
  final Color progressColor;
  final Color progressExceededColor;
  final double thickness;

  const CameraProgressTheme({
    required this.surfaceColor,
    required this.progressColor,
    required this.progressExceededColor,
    required this.thickness,
  });

  /// Widget color scheme for default light mode.
  static const defaultLight = CameraProgressTheme(
    surfaceColor: DgisColorScheme.dimmedWhite,
    progressColor: DgisColorScheme.blackFiftyPercent,
    progressExceededColor: DgisColorScheme.speedometerRed,
    thickness: 4,
  );

  /// Widget color scheme for default dark mode.
  static const defaultDark = CameraProgressTheme(
    surfaceColor: DgisColorScheme.slightlyDimmedGrey,
    progressColor: DgisColorScheme.dimmedWhite,
    progressExceededColor: DgisColorScheme.speedometerRed,
    thickness: 4,
  );

  @override
  CameraProgressTheme copyWith({
    Color? surfaceColor,
    Color? progressColor,
    Color? progressExceededColor,
    double? thickness,
  }) {
    return CameraProgressTheme(
      surfaceColor: surfaceColor ?? this.surfaceColor,
      progressColor: progressColor ?? this.progressColor,
      progressExceededColor:
          progressExceededColor ?? this.progressExceededColor,
      thickness: thickness ?? this.thickness,
    );
  }
}
