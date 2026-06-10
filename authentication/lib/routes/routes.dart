import 'package:authentication/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:authentication/widgets/auth_check.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
        '/': (_) => const HomePage(),
        '/auth-check': (_) => const AuthCheck(),
      };

  static final navigatorKey = GlobalKey<NavigatorState>();
  static String initial = '/';
  static String authCheck = '/auth-check';

  static NavigatorState to = Routes.navigatorKey.currentState!;
}
