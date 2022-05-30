import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../models/game_move.dart';
import '../providers/game.dart';
import '../providers/players/player.dart';

class GameBoard extends StatefulWidget {
  final Function announceStatus;

  const GameBoard(this.announceStatus, {Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final Game game = Game();
  final Player player = Player();
  late StreamSubscription newGame;

  @override
  void initState() {
    newGame = game.onNewGame.listen((event) {
      developer.log('NEW GAME', name: '_GameBoardState.initState');
      widget.announceStatus(null);
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    newGame.cancel();

    super.dispose();
  }

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
              stream: game.onMove,
              builder: (context, snapshot) {
                developer.log('EVENT: ${snapshot.data.toString()}', name: '_GameBoardState.build');
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: game.boardColSize,
                  ),
                  shrinkWrap: true,
                  itemCount: game.boardRowSize * game.boardColSize,
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
            child: Center(child: _buildBoardItem(context, row, col))),
      ),
    );
  }

  Widget _buildBoardItem(BuildContext context, int row, int col) {
    switch (game.board[row][col]) {
      case 0:
        return LayoutBuilder(builder: (context, constraint) {
          return Icon(
            Icons.panorama_fish_eye,
            color: Colors.blue,
            size: constraint.biggest.height,
          );
        });
      case 1:
        return LayoutBuilder(builder: (context, constraint) {
          return Icon(
            Icons.close,
            color: Colors.red,
            size: constraint.biggest.height,
          );
        });
      default:
        return Container();
    }
  }

  void _gridItemTapped(int row, int col) {
    // Human move
    if (game.isBoardOpened) {
      GameMove? move = game.recordMove(row, col);
      widget.announceStatus(move);
    }

    // TODO: implement AI for computer move
    if (game.isBoardOpened) {
      GameMove? move = player.play(game.board, game.symbol, game.winLength);
      if (move != null) {
        move = game.recordMove(move.row, move.col);
        widget.announceStatus(move);
      }
    }
  }
}
