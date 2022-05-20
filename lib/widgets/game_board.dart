import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../providers/game.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  Game game = Game();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: (game.boardColSize / game.boardRowSize),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: game.boardColSize,
                  ),
                  itemBuilder: _buildBoardItems,
                  itemCount: game.boardRowSize * game.boardColSize,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBoardItems(BuildContext context, int index) {
    int row, col = 0;
    row = (index / game.boardColSize).floor();
    col = (index % game.boardColSize);
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
    switch (game.board[row][col]) {
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
    developer.log('Tapped $row, $col');
    game.move(row, col);
    developer.log(game.board.toString());

    setState(() {});
  }
}
