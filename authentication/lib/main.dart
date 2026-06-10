import 'package:flutter/material.dart';
import 'package:authentication/routes/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      routes: Routes.list,
      initialRoute: Routes.authCheck,
      navigatorKey: Routes.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
