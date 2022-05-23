import 'package:flutter/material.dart';

import '../widgets/game_board.dart';
import '../widgets/game_nav_bar.dart';
import '../widgets/secret_button.dart';
import '../widgets/game_score.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Pišiškvorky',
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      floatingActionButton: const SecretButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  GameBoard(),
                ],
              ),
            ),
            const GameScore(),
          ],
        ),
      ),
      bottomNavigationBar: const GameNavigation(),
    );
  }
}
