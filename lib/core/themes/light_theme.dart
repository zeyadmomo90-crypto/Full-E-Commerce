import 'package:flutter/material.dart';
import 'package:ppp/core/themes/app_colors.dart';
import 'package:ppp/core/themes/app_text_style.dart';

class LightTheme {
  static BorderRadius borderRadius = BorderRadius.circular(14);
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      onSecondary: Colors.white,
    ),

    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    dividerTheme: DividerThemeData(color: Colors.grey.shade300, thickness: 1),

    // AppBar
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    // Icons
    iconTheme: const IconThemeData(color: AppColors.primary, size: 24),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.primary),
    ),

    // TextField
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: borderRadius),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(color: AppColors.error),
      ),
    ),

    // Text
    textTheme: AppTextStyles.textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),

    // Cards
    cardTheme: CardThemeData(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
    ),

    // Chips
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
      selectedColor: AppColors.primary,
      labelStyle: const TextStyle(color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
    ),

    // Bottom Navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),

    // Dialog
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
    ),

    // SnackBar
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
