import 'package:flutter/material.dart';

class Themes {
  static ThemeData appTheme(bool use) {
    if (use) {
      return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.grey.shade300,
          onPrimary: Colors.black,
          secondary: Colors.grey.shade400,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.redAccent,
          surface: Colors.grey.shade800,
          onSurface: Colors.grey.shade900,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[600],
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
          centerTitle: true,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.grey[600],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.yellowAccent,
            minimumSize: const Size(64, 32),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    } else {
      return ThemeData(
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      );
    }
  }
}
