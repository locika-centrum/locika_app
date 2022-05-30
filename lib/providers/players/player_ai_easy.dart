import 'dart:developer' as developer;
import 'dart:math';

import '../../models/game_move.dart';
import './player_ai.dart';

class PlayerAIEasy extends PlayerAI {
  @override
  GameMove? play(List<List<int?>> board, int symbol, int winLength) {
    this.board = board;
    this.symbol = symbol;
    this.winLength = winLength;

    List<GameMove> moves = _collectPossibleMoves();
    developer.log('Player (EASY): Possible moves count: ${moves.length}',
        name: 'PlayerAIEasy');
    return moves[Random().nextInt(moves.length)];
  }

  // TODO: implement play
  List<Move> _evaluateBoard() {
    List<Move> result = [];

    for (int row = 0; row < board.length; row++) {
      for (int col = 0; col < board[row].length; col++) {
        if (board[row][col] == null) {
          Move move = Move(row: row, col: col, symbol: symbol);
          List<Move> surroundings = _getSurroundingCells(row, col);

          for (final line in getLinesThrough(move)) {
            developer.log('Line: $line', name: 'PlayerAIEasy._evaluateBoard');
          }
        }
      }
    }

    return result;
  }

  List<Move> _getSurroundingCells(int row, int col) {
    List<Move> result = [];

    for (int i = -1; i < 2; i++) {
      if (row + i < 0 || row + i >= board.length) continue;
      for (int j = -1; j < 2; j++) {
        if (col + j < 0 || col + j >= board[0].length) continue;
        if (i == 0 && j == 0) continue;
        if (board[row + i][col + j] != null) {
          result.add(Move(row: row + i, col: col + i, symbol: symbol));
        }
      }
    }

    return result;
  }

  List<GameMove> _collectPossibleMoves() {
    List<GameMove> result = [];
    for (int row = 0; row < board.length; row++) {
      for (int col = 0; col < board[row].length; col++) {
        if (board[row][col] == null) {
          if (_adjacentCell(row, col)) {
            result.add(GameMove(row: row, col: col, symbol: symbol));
          }
        }
      }
    }
    return result;
  }

  bool _adjacentCell(int row, int col) {
    bool result = false;
    for (int i = -1; i < 2; i++) {
      if (row + i < 0 || row + i >= board.length) continue;
      for (int j = -1; j < 2; j++) {
        if (col + j < 0 || col + j >= board[0].length) continue;
        if (i == 0 && j == 0) continue;
        result = result || (board[row + i][col + j] != null);
      }
      if (result) break;
    }

    return result;
  }
}
