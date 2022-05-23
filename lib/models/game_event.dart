class GameEvent {
  final int row;
  final int col;
  final int symbol;

  const GameEvent({
    required this.row,
    required this.col,
    required this.symbol,
  });

  @override
  String toString() {
    return 'Move (${symbol == 0 ? 'o' : 'x'}) - [$row, $col]';
  }
}
