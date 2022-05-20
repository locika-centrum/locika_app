class Game {
  static const int _cMaxRows = 15;
  static const int _cMaxCols = 12;
  static const int _cWinLength = 5;

  late int _rows, _cols, _winLength;
  late int _symbol;
  late List<List<int?>> _board;

  Game() {
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

  void _cleanBoard() {
    _board = List.generate(
        _rows,
        (int index) =>
            List.generate(_cols, (int index) => null, growable: false),
        growable: false);
  }

  void move(int row, int col) {
    if (_board[row][col] == null) {
      _board[row][col] = _symbol;
      _symbol = 1 - _symbol;
    }
  }
}
