import 'package:bloc_practise/Presentation/screen/home_screen.dart';
import 'package:bloc_practise/Theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';

class AppRouter {
  late ThemeCubit themeCubit;
  AppRouter() {
    themeCubit = ThemeCubit();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        }
    }
    return null;
  }
}
