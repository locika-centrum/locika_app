enum MoveStatus {
  normal,
  winning,
  draw,
}

enum Direction { row, column, diagonal1, diagonal2 }

class Move {
  final int row;
  final int col;
  final int symbol;
  int score = 0;

  Move({
    required this.row,
    required this.col,
    required this.symbol,
  });


}

class GameMove extends Move {
  var _moveStatus = MoveStatus.normal;
  final List<Direction> _winDirections = [];

  GameMove({
    required row,
    required col,
    required symbol,
  }) : super(
          row: row,
          col: col,
          symbol: symbol,
        );

  List<Direction> get winDirections => _winDirections;
  get moveStatus => _moveStatus;

  set moveStatus(value) {
    _moveStatus = value;
  }

  void addWinDirection(Direction direction) {
    _winDirections.add(direction);
  }

  @override
  String toString() {
    String result = '';
    if (moveStatus != MoveStatus.normal) {
      result = (moveStatus == MoveStatus.winning) ? ' - WINNING' : ' - DRAW';
    }
    if (moveStatus == MoveStatus.winning) {
      result += ' $_winDirections';
    }

    return 'Move (${symbol == 0 ? 'o' : 'x'}) - [$row, $col]$result)';
  }
}
