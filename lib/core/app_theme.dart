import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 239, 239, 242));

class AppThemeData {
  ThemeData themeData = ThemeData().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(255, 239, 239, 242),
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.primaryContainer,
    ),
    textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: kColorScheme.onSecondaryContainer,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          bodyLarge: TextStyle(
            color: kColorScheme.onSecondary,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
    cardTheme: const CardTheme().copyWith(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: kColorScheme.secondaryContainer,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primary,
      foregroundColor: kColorScheme.secondaryContainer,
    )),
  );
}
