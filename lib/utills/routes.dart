import 'package:flutter/material.dart';

import '../view/screens/ClockApp.dart';

class Routes {
  static String clockApp = '/';

  static Map<String, WidgetBuilder> myRoutes = {
    clockApp: (context) => const ClockApp(),
  };
}
