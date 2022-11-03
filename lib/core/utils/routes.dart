import 'package:flutter/material.dart';

import '../../features/home/presentation/auth/login_screen.dart';
import '../../features/home/presentation/home_screen.dart';


class Routes {
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => const LoginScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}
