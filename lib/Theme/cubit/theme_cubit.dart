import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool _isDark = false;

  bool get isDark => _isDark;

  void toggle() {
    _isDark = !_isDark;
    emit(ThemeChanged());
    if (_isDark) {
      emit(ThemeDark(message: 'The Theme is Dark'));
    } else {
      emit(ThemeLight(message: 'The Theme is Light'));
    }
  }

 

 
}
