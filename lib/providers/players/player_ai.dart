import 'dart:math';

import '../../models/game_move.dart';

abstract class PlayerAI {
  late List<List<int?>> board;
  late int symbol;
  late int winLength;

  GameMove? play(List<List<int?>> board, int symbol, int winLength);

  Iterable<List<Move>> getLinesThrough(Move move) sync* {
    for (int row = min(0, move.row - winLength + 1); row <= move.row; row++) {

    }
  }
}