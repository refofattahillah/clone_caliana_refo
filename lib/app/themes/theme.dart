import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Color(0xFF00BCD4);
  static final Color secondaryColor = Color(0xFFE0F7FA);
  static final Color backgroundColor = Colors.white;
  static final Color lightGrey = Color(0xFFF5F5F5);
  static final Color textColor = Colors.black87;
  static final Color textLightColor = Colors.grey;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: textColor),
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: textColor,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: textLightColor,
        fontSize: 12,
      ),
    ),
  );
}