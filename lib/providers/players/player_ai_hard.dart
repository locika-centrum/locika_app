import 'dart:developer' as developer;

import '../../models/game_move.dart';
import './player_ai.dart';

class PlayerAIHard extends PlayerAI {
  @override
  GameMove? play(List<List<int?>> board, int symbol, int winLength) {
    // TODO: implement play
    developer.log('Player: HARD');
    return null;
  }
}