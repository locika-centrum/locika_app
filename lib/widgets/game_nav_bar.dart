import 'package:flutter/material.dart';

import '../providers/game.dart';

class GameNavigation extends StatelessWidget {
  const GameNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.home,
                size: 35,
              ),
            ),
            GestureDetector(
              onTap: () {
                Game game = Game();
                game.newGame();
              },
              child: const Icon(
                Icons.refresh,
                size: 35,
              ),
            )
          ],
        )
    );
  }
}
