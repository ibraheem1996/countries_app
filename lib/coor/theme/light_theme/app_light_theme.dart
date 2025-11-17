import 'package:flutter/material.dart';
import 'app_light_colors.dart';
import 'app_light_text_theme.dart';
import '../app_radius.dart';

class AppLightTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // -------------------------
    // COLOR SCHEME
    // -------------------------
    colorScheme: const ColorScheme(
      brightness: Brightness.light,

      primary: AppLightColors.primary,
      onPrimary: Colors.white,

      secondary: AppLightColors.secondary,
      onSecondary: Colors.white,

      surface: AppLightColors.surface,
      onSurface: AppLightColors.textPrimary,
      surfaceContainerLowest:AppLightColors.surfaceContainerLowest, 

      error: AppLightColors.error,
      onError: Colors.white,

      outline: AppLightColors.greyLight,
    ),

    // -------------------------
    // TEXT THEME
    // -------------------------
    textTheme: const TextTheme(
      displayLarge: AppLightTextTheme.headline,
      headlineLarge: AppLightTextTheme.title,
      bodyLarge: AppLightTextTheme.body,
      bodyMedium: AppLightTextTheme.small,
    ),

    // -------------------------
    // APP BAR
    // -------------------------
    appBarTheme: const AppBarTheme(
      backgroundColor: AppLightColors.appBarColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppLightColors.textPrimary,
      ),
      iconTheme: IconThemeData(color: AppLightColors.textPrimary),
    ),

    // -------------------------
    // CARDS
    // -------------------------
    cardTheme: CardThemeData(
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.card),
      shadowColor: Colors.black.withValues(alpha: 0.08),
    ),
    shadowColor: Colors.black.withValues(alpha: 0.8),
  );
}
