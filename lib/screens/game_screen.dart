import 'package:flutter/material.dart';
import 'package:locika_app/widgets/game_widget.dart';

import '../widgets/game_nav_bar.dart';
import '../widgets/secret_button.dart';

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
      body: const Center(
        child: GameWidget(),
      ),
      bottomNavigationBar: const GameNavigation(),
    );
  }
}
