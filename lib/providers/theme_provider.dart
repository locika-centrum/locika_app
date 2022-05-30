import 'package:flutter/material.dart';

class AppThemes {
  static const String _fontFamily = 'Love Ya Like A Sister';
  // static const String _fontFamily = 'Luckiest Guy';
  // static const String _fontFamily = 'Freckle Face';

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    fontFamily: _fontFamily,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 35,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
      ),
      labelLarge: TextStyle(
        fontSize: 25,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.white70),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white24,
      titleTextStyle: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 35,
      ),
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: _fontFamily,
        fontSize: 25,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    fontFamily: _fontFamily,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 35,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
      ),
      labelLarge: TextStyle(
        fontSize: 25,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black26,
      titleTextStyle: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 35,
      ),
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: _fontFamily,
        fontSize: 25,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
    ),
  );

  static final violetTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.deepPurple.shade100,
    colorScheme: const ColorScheme.light(),
    fontFamily: _fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
    ),
  );
}
