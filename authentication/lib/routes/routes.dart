import 'package:authentication/pages/home_page.dart';
import 'package:authentication/pages/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:authentication/widgets/auth_check.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
        '/': (_) => const HomePage(),
        '/auth-check': (_) => const AuthCheck(),
        '/sign-in': (_) => const SignInPage(),
      };

  static final navigatorKey = GlobalKey<NavigatorState>();
  static String initial = '/';
  static String authCheck = '/auth-check';
  static String signIn = '/sign-in';

  static NavigatorState to = Routes.navigatorKey.currentState!;
}
