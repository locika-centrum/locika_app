import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.white,
    fontFamily: 'Luckiest Guy',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.white70),
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'Luckiest Guy',
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
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.black,
    fontFamily: 'Luckiest Guy',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black26,
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: 'Luckiest Guy',
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
    scaffoldBackgroundColor: Colors.deepPurple.shade100,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
    ),
  );
}
