import 'dart:async';
import 'dart:developer' as developer;

import '../models/game_event.dart';

/// Singleton representing piškvorky game
class Game {
  static final Game _instance = Game._internal();
  final StreamController _onUpdate = StreamController<GameEvent?>.broadcast();

  static const int _cMaxRows = 15;
  static const int _cMaxCols = 12;
  static const int _cWinLength = 5;

  late int _rows, _cols, _winLength;
  late int _symbol;
  late List<List<int?>> _board;

  factory Game() {
    return _instance;
  }

  Game._internal() {
    _rows = _cMaxRows;
    _cols = _cMaxCols;
    _winLength = _cWinLength;
    _symbol = 0;

    _cleanBoard();
  }

  int get boardRowSize => _rows;
  int get boardColSize => _cols;
  int get symbol => _symbol;
  List<List<int?>> get board => _board;
  Stream get onUpdate => _onUpdate.stream;

  void _cleanBoard() {
    developer.log('Cleaning Game Board');
    _board = List.generate(
        _rows,
        (int index) =>
            List.generate(_cols, (int index) => null, growable: false),
        growable: false);

    _onUpdate.add(null);
  }

  void newGame() {
    _cleanBoard();
  }

  void recordMove(int row, int col) {
    if (_board[row][col] == null) {
      _board[row][col] = _symbol;
      developer.log('recordMove: (${_symbol == 0 ? 'o' : 'x'}) $row, $col');
      _onUpdate.add(GameEvent(
        row: row,
        col: col,
        symbol: _symbol,
      ));

      _symbol = 1 - _symbol;
    }
  }
}
