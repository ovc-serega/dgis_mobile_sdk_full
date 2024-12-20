import 'package:flutter/widgets.dart';

import '../common/dgis_color_scheme.dart';
import '../map/map_widget_color_scheme.dart';
import '../widget_shadows.dart';

class NavigationMapControlTheme extends MapWidgetColorScheme {
  final double size;
  final double borderRadius;

  final Color surfaceColor;
  final Color surfacePressedColor;

  final double iconSize;

  final Color iconDisabledColor;
  final Color iconInactiveColor;
  final Color iconActiveColor;

  final List<BoxShadow> shadows;

  const NavigationMapControlTheme({
    required this.size,
    required this.borderRadius,
    required this.surfaceColor,
    required this.surfacePressedColor,
    required this.iconSize,
    required this.iconDisabledColor,
    required this.iconInactiveColor,
    required this.iconActiveColor,
    required this.shadows,
  });

  /// Widget color scheme for default light mode.
  static const NavigationMapControlTheme defaultLight =
      NavigationMapControlTheme(
    size: 44,
    borderRadius: 8,
    surfaceColor: DgisColorScheme.surfaceLight,
    surfacePressedColor: DgisColorScheme.dimmedSurfaceLight,
    iconSize: 42,
    iconInactiveColor: DgisColorScheme.dimmedGrey,
    iconDisabledColor: DgisColorScheme.dimmedLightGrey,
    iconActiveColor: DgisColorScheme.activeBlueLight,
    shadows: WidgetShadows.naviWidgetBoxShadowsLight,
  );

  /// Widget color scheme for default dark mode.
  static const NavigationMapControlTheme defaultDark =
      NavigationMapControlTheme(
    size: 44,
    borderRadius: 8,
    surfaceColor: DgisColorScheme.surfaceDark,
    surfacePressedColor: DgisColorScheme.darkGrey,
    iconSize: 42,
    iconInactiveColor: DgisColorScheme.dimmedLightGrey,
    iconDisabledColor: DgisColorScheme.disabledGrey,
    iconActiveColor: DgisColorScheme.activeBlueDark,
    shadows: WidgetShadows.naviWidgetBoxShadowsDark,
  );

  @override
  NavigationMapControlTheme copyWith({
    double? size,
    double? borderRadius,
    Color? surfaceColor,
    Color? surfacePressedColor,
    double? iconSize,
    Color? iconDisabledColor,
    Color? iconInactiveColor,
    Color? iconActiveColor,
    List<BoxShadow>? shadows,
  }) {
    return NavigationMapControlTheme(
      size: size ?? this.size,
      borderRadius: borderRadius ?? this.borderRadius,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      surfacePressedColor: surfacePressedColor ?? this.surfacePressedColor,
      iconSize: iconSize ?? this.iconSize,
      iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
      iconInactiveColor: iconInactiveColor ?? this.iconInactiveColor,
      iconActiveColor: iconActiveColor ?? this.iconActiveColor,
      shadows: shadows ?? this.shadows,
    );
  }
}
