import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static const TextTheme lightTextTheme = TextTheme(
    labelSmall: TextStyle(
      color: kStarColor,
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 15.0,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 13.0,
    ),
    displaySmall: TextStyle(
      color: kSecondaryTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 12.0,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 28.0,
    ),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: Colors.white,
      textTheme: lightTextTheme,
      appBarTheme: const AppBarTheme().copyWith(
        toolbarHeight: 35.0,
        elevation: 0.0,
        color: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: false,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 15.0,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: kPrimaryColor2,
          minimumSize: const Size(double.infinity, 52.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0.0,
        height: 45.0,
        indicatorColor: kPrimaryColor,
        surfaceTintColor: Colors.white,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
