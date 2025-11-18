import 'package:flutter/material.dart';
import '../app_radius.dart';
import 'app_dark_colors.dart';
import 'app_dark_text_theme.dart';


class AppDarkTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // -------------------------
    // COLOR SCHEME
    // -------------------------
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppDarkColors.primary,
      onPrimary: Colors.white,

      secondary: AppDarkColors.secondary,
      onSecondary: Colors.white,

      surface: AppDarkColors.surface,
      surfaceContainerLowest: AppDarkColors.surfaceContainerLowest,
      surfaceContainerLow: AppDarkColors.surfaceContainerLow,
      

      onSurface: AppDarkColors.textPrimary,

      error: AppDarkColors.error,
      onError: Colors.white,

      outline: AppDarkColors.divider,
    ),

    // -------------------------
    //! TEXT THEME
    // -------------------------
    textTheme: AppDarkTextTheme.darkTextTheme,

    // -------------------------
    // APP BAR
    // -------------------------
    appBarTheme: const AppBarTheme(
      backgroundColor: AppDarkColors.appBarColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppDarkColors.textPrimary,
      ),
      iconTheme: IconThemeData(color: AppDarkColors.textPrimary),
    ),

    // -------------------------
    // CARDS
    // -------------------------
    cardTheme: CardThemeData(
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.card),
      shadowColor: Colors.black.withValues(alpha: 0.4),
    ),

    shadowColor: Colors.black.withValues(alpha: 0.4),
  );
}
