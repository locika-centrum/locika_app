import 'dart:developer' as developer;

import '../../providers/players/player_ai.dart';
import '../../models/game_move.dart';
import './player_ai_easy.dart';

class Player {
  static final Player _instance = Player._internal();

  late PlayerAI _player;

  factory Player({int? playerAIIndex}) {
    return _instance;
  }

  Player._internal() {
    _player = PlayerAIEasy();
  }

  void switchPlayer({PlayerAI? playerAI}) {
    if (playerAI != null) {
      _player = playerAI;
    }
  }

  GameMove? play(List<List<int?>> board, int symbol, int winLength) =>
      _player.play(board, symbol, winLength);
}
