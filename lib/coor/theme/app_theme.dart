import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';
import 'app_sizes.dart';
import 'app_radius.dart';

class AppTheme {
  // -------------------------
  //!        LIGHT THEME
  // -------------------------
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // -------------------------
    //! Colors
    // -------------------------
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.surface,

    // -------------------------
    //! Text Theme
    // -------------------------
    textTheme: const TextTheme(
      displayLarge: AppTextTheme.headline,
      headlineLarge: AppTextTheme.title,
      bodyLarge: AppTextTheme.body,
      bodyMedium: AppTextTheme.small,
    ),

    // -------------------------
    //! AppBar Theme
    // -------------------------
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),

    // -------------------------
    //! Elevated Button Theme
    // -------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.r12),
        padding: const EdgeInsets.symmetric(vertical: AppSizes.s12, horizontal: AppSizes.s20),
      ),
    ),

    // -------------------------
    //! Input Decoration Theme
    // -------------------------
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: TextStyle(color: AppColors.grey),
      labelStyle: TextStyle(color: AppColors.textSecondary, fontSize: 14),
      contentPadding: EdgeInsets.symmetric(vertical: AppSizes.s12, horizontal: AppSizes.s16),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.r12,
        borderSide: BorderSide(color: AppColors.greyLight, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.r12,
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.r12,
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
    ),

    // -------------------------
    //! Card Theme
    // -------------------------

    cardTheme: CardThemeData(
      elevation: 0,
      margin: const EdgeInsets.all(AppSizes.s12),
      shape:const RoundedRectangleBorder(borderRadius: AppRadius.card),
      shadowColor: Colors.black.withValues(alpha:  0.08),
    ),
    // -------------------------
    //! Icon Theme
    // -------------------------
    iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),

    // -------------------------
    //! Divider Theme
    // -------------------------
    dividerTheme: const DividerThemeData(
      color: AppColors.greyLight,
      thickness: 1,
      space: AppSizes.s12,
    ),
  );
}
