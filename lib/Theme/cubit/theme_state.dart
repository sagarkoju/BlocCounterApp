// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState {}

class ThemeDark extends ThemeState {
  final String message;
  ThemeDark({
    required this.message,
  });
}

class ThemeLight extends ThemeState {
  final String message;
  ThemeLight({
    required this.message,
  });
}
