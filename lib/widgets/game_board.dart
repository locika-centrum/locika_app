import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../providers/game.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final Game _game = Game();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
          child: Center(
            child: StreamBuilder(
              stream: _game.onUpdate,
              builder: (context, snapshot) {
                developer.log('EVENT: ${snapshot.data.toString()}');
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _game.boardColSize,
                  ),
                  shrinkWrap: true,
                  itemCount: _game.boardRowSize * _game.boardColSize,
                  itemBuilder: _buildBoardItems,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBoardItems(BuildContext context, int index) {
    int row, col = 0;
    row = (index / _game.boardColSize).floor();
    col = (index % _game.boardColSize);
    return GestureDetector(
      onTap: () => _gridItemTapped(row, col),
      child: GridTile(
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 0.5,
              ),
            ),
            child: Center(child: _buildBoardItem(row, col))),
      ),
    );
  }

  Widget _buildBoardItem(int row, int col) {
    switch (_game.board[row][col]) {
      case 0:
        return const Icon(
          Icons.panorama_fish_eye,
          color: Colors.blue,
        );
      case 1:
        return const Icon(
          Icons.close,
          color: Colors.red,
        );
      default:
        return Container();
    }
  }

  // TODO: implement AI for computer move
  void _gridItemTapped(int row, int col) {
    _game.recordMove(row, col);
  }
}
