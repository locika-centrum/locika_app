import 'package:flutter/material.dart';
import 'dart:developer' as developer;

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
                developer.log('New game tap');
              },
              child: const Icon(
                Icons.refresh,
                size: 35,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Icon(
                Icons.settings,
                size: 35,
              ),
            )
          ],
        )
    );
  }
}
