import 'package:countries/coor/cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dependency/dependency_get_it.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final pref = getIt<SharedPreferences>();
  ThemeCubit() : super(ThemeMode.light) {
    final bool? isDark = pref.getBool(PrefsKeys.isDark);
    emit(isDark == null || isDark == false ? ThemeMode.light : ThemeMode.dark);
  }

  void toggleTheme() async {
    print("toggleTheme");
    final bool? isDark = pref.getBool(PrefsKeys.isDark);
    if (isDark == null || isDark == false) {
      emit(ThemeMode.dark);
      await getIt<SharedPreferences>().setBool(PrefsKeys.isDark, true);
      return;
    }

    emit(ThemeMode.light);
    await getIt<SharedPreferences>().setBool(PrefsKeys.isDark, false);
  }
}
