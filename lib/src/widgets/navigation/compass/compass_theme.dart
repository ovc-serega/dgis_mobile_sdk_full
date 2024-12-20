import 'package:flutter/widgets.dart';

import '../../map/map_widget_color_scheme.dart';

class NavigationCompassWidgetTheme extends MapWidgetColorScheme {
  final Color surfaceColor;

  const NavigationCompassWidgetTheme({required this.surfaceColor});

  @override
  NavigationCompassWidgetTheme copyWith({Color? surfaceColor}) {
    return NavigationCompassWidgetTheme(
      surfaceColor: surfaceColor ?? this.surfaceColor,
    );
  }
}
