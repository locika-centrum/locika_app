import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../models/game_move.dart';
import '../providers/game.dart';
import 'game_board.dart';
import 'game_score.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  Widget _statusWidget = const Text(
    '',
    style: TextStyle(
      fontSize: 25,
    ),
  );

  @override
  initState() {
    _statusWidget = Text(
      Game().isBoardOpened ? '' : 'Game Over',
      style: const TextStyle(
        fontSize: 25,
      ),
    );
    super.initState();
  }

  void announceStatus(GameMove? gameMove) {
    developer.log('announceStatus - $gameMove', name: '_GameWidgetState.announceStatus');
    switch (gameMove?.moveStatus) {
      case MoveStatus.winning:
        _statusWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gameMove?.symbol == 1 ? Icons.close : Icons.panorama_fish_eye,
              color: gameMove?.symbol == 1 ? Colors.red : Colors.blue,
              size: 25,
            ),
            const Text(
              ' vyhrál!',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        );
        break;
      case MoveStatus.draw:
        _statusWidget = const Text(
          'Remíza',
          style: TextStyle(
            fontSize: 25,
          ),
        );
        break;
      default:
        _statusWidget = const Text(
          '',
          style: TextStyle(
            fontSize: 25,
          ),
        );
        break;
    }
    setState(() {
      _statusWidget = Center(child: _statusWidget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const GameScore(),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameBoard(announceStatus),
          ],
        ),
        const Spacer(
          flex: 2,
        ),
        _statusWidget,
      ],
    );
  }
}
