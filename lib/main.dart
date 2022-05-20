import 'package:flutter/material.dart';

import 'screens/game_screen.dart';
import 'screens/choices_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/chat_screen.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: '/game',
      routes: {
        '/game': (context) => const GameScreen(),
        '/choices': (context) => const ChoicesScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}
