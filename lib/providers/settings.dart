import 'package:shared_preferences/shared_preferences.dart';

import '../providers/game.dart';
import '../providers/players/player.dart';
import '../providers/players/player_ai.dart';
import '../providers/players/player_ai_easy.dart';
import '../providers/players/player_ai_hard.dart';

class AppPreferences {
  static final List<Map> optionPreferences = [
    {
      'key': 'game_complexity',
      'values': ['snadná', 'těžká'],
      'callback': Player().switchPlayer,
      'params': [
        {#playerAI: PlayerAIEasy()},
        {#playerAI: PlayerAIHard()},
      ],
    },
    {
      'key': 'game_size',
      'values': ['malá', 'střední', 'velká', 'největší'],
      'callback': Game().newGame,
      'params': [
        {#rows: 3, #cols: 3, #winLength: 3},
        {#rows: 5, #cols: 5, #winLength: 4},
        {#rows: 10, #cols: 10, #winLength: 5},
        {#rows: 15, #cols: 12, #winLength: 5},
      ],
    }
  ];

  static late SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences.getInt('game_size') == null) _preferences.setInt('game_size', 0);
    if (_preferences.getInt('game_complexity') == null) _preferences.setInt('game_complexity', 0);
  }

  static int getBoardRows() => optionPreferences
          .firstWhere((element) => element['key'] == 'game_size')['params']
      [_preferences.getInt('game_size')][#rows];

  static int getBoardCols() => optionPreferences
          .firstWhere((element) => element['key'] == 'game_size')['params']
      [_preferences.getInt('game_size')][#cols];

  static int getBoardWinLength() => optionPreferences
          .firstWhere((element) => element['key'] == 'game_size')['params']
      [_preferences.getInt('game_size')][#winLength];

  static PlayerAI getPlayer() => optionPreferences.firstWhere(
          (element) => element['key'] == 'game_complexity')['params']
      [_preferences.getInt('game_complexity')][#playerAI];

  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  Future<int> getOptionPreferenceIndex(String key) async {
    final prefs = await sharedPreferences;
    int? index = prefs.getInt(key);
    index ??= 0;

    return index;
  }

  Future<void> setOptionPreference(String key, int index) async {
    final prefs = await sharedPreferences;
    await prefs.setInt(key, index);
  }
}
