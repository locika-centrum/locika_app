import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math';

import '../models/game_move.dart';

/// Singleton representing piškvorky game
class Game {
  static final Game _instance = Game._internal();
  final StreamController _onMove = StreamController<GameMove>.broadcast();
  final StreamController _onNewGame = StreamController<bool>.broadcast();

  static const int _cMaxRows = 12;
  static const int _cMaxCols = 12;
  static const int _cWinLength = 5;

  late int _rows, _cols, _winLength;
  late int _symbol;
  late List<List<int?>> _board;
  late int _movesLeft;
  late bool _isOpened;

  factory Game({int? rows, int? cols, int? symbol}) {
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
  int get winLength => _winLength;
  int get symbol => _symbol;
  List<List<int?>> get board => _board;
  bool get isBoardOpened => _isOpened;
  Stream get onMove => _onMove.stream;
  Stream get onNewGame=> _onNewGame.stream;

  void newGame({int? rows, int? cols, int? winLength, int? symbol}) {
    if (rows != null && cols != null && winLength != null) {
      _rows = min(rows, _cMaxRows);
      _cols = min(cols, _cMaxCols);
      _winLength = min(winLength, _cWinLength);
    }
    if (symbol != null) _symbol = symbol;
    developer.log('New game with params: ($_rows, $_cols - $_winLength) - $_symbol', name: 'Game.newGame');

    _cleanBoard();
  }

  GameMove? recordMove(int row, int col) {
    _isOpened = false;

    GameMove? move;
    if (_board[row][col] == null) {
      _movesLeft--;
      _board[row][col] = _symbol;
      move = _evalMove(row, col);

      developer.log('recordMove: $move', name: 'Game.recordMove');
      _onMove.add(move);

      _symbol = 1 - _symbol;
      _isOpened = move.moveStatus == MoveStatus.normal ? true : false;
    }
    return move;
  }

  GameMove? getBestMove() {
    GameMove? result;

    return result;
  }

  void getAndRecordBestMove() {
    GameMove? bestMove = getBestMove();

    if (bestMove != null) {
      recordMove(bestMove.row, bestMove.col);
    }
  }

  void _cleanBoard() {
    developer.log('Cleaning Game Board', name: 'Game._cleanBoard');
    _board = List.generate(
        _rows,
        (int index) =>
            List.generate(_cols, (int index) => null, growable: false),
        growable: false);
    _movesLeft = _rows * _cols;
    _isOpened = true;

    _onNewGame.add(true);
  }

  void _highlightWinner(GameMove move) {
  }

  GameMove _evalMove(int row, int col, {List<List<int?>>? board, int? symbol}) {
    board ??= _board;
    symbol ??= _symbol;
    GameMove result = GameMove(row: row, col: col, symbol: symbol);

    if (_evalRow(row, col, board, symbol) == MoveStatus.winning) {
      result.moveStatus = MoveStatus.winning;
      result.addWinDirection(Direction.row);
    }
    if (_evalColumn(row, col, board, symbol) == MoveStatus.winning) {
      result.moveStatus = MoveStatus.winning;
      result.addWinDirection(Direction.column);
    }
    if (_evalDiagonal1(row, col, board, symbol) == MoveStatus.winning) {
      result.moveStatus = MoveStatus.winning;
      result.addWinDirection(Direction.diagonal1);
    }
    if (_evalDiagonal2(row, col, board, symbol) == MoveStatus.winning) {
      result.moveStatus = MoveStatus.winning;
      result.addWinDirection(Direction.diagonal2);
    }
    if (result.moveStatus != MoveStatus.winning && _movesLeft == 0) {
      result.moveStatus = MoveStatus.draw;
    }

    return result;
  }

  MoveStatus _evalRow(int row, int col, List<List<int?>> board, int symbol) {
    int symbolCount = 1;
    if (col > 0) {
      for (int i = col - 1; i >= 0; i--) {
        if (board[row][i] != symbol) break;
        symbolCount++;
      }
    }
    if (col < _cols - 1) {
      for (int i = col + 1; i < _cols; i++) {
        if (board[row][i] != symbol) break;
        symbolCount++;
      }
    }

    return symbolCount >= _winLength ? MoveStatus.winning : MoveStatus.normal;
  }

  MoveStatus _evalColumn(int row, int col, List<List<int?>> board, int symbol) {
    int symbolCount = 1;
    symbolCount = 1;
    if (row > 0) {
      for (int i = row - 1; i >= 0; i--) {
        if (board[i][col] != symbol) break;
        symbolCount++;
      }
    }
    if (row < _rows - 1) {
      for (int i = row + 1; i < _rows; i++) {
        if (board[i][col] != symbol) break;
        symbolCount++;
      }
    }

    return symbolCount >= _winLength ? MoveStatus.winning : MoveStatus.normal;
  }

  MoveStatus _evalDiagonal1(
      int row, int col, List<List<int?>> board, int symbol) {
    int symbolCount = 1;
    if (col > 0 && row > 0) {
      for (int i = -1; i >= -min(row, col); i--) {
        if (board[row + i][col + i] != symbol) break;
        symbolCount++;
      }
    }
    if ((col < _cols - 1) && (row < _rows - 1)) {
      for (int i = 1; i < min(_rows - row, _cols - col); i++) {
        if (board[row + i][col + i] != symbol) break;
        symbolCount++;
      }
    }

    return symbolCount >= _winLength ? MoveStatus.winning : MoveStatus.normal;
  }

  MoveStatus _evalDiagonal2(
      int row, int col, List<List<int?>> board, int symbol) {
    int symbolCount = 1;
    if (col > 0 && (row < _rows - 1)) {
      for (int i = -1; i >= -min(_rows - row - 1, col); i--) {
        if (board[row - i][col + i] != symbol) break;
        symbolCount++;
      }
    }
    if ((col < _cols - 1) && row > 0) {
      for (int i = 1; i < min(row + 1, _cols - col); i++) {
        if (board[row - i][col + i] != symbol) break;
        symbolCount++;
      }
    }

    return symbolCount >= _winLength ? MoveStatus.winning : MoveStatus.normal;
  }
}
