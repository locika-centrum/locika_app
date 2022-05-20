import 'package:flutter/material.dart';

class GameScore extends StatelessWidget {
  const GameScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '0 : 0',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
