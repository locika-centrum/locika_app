import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.home),
      onPressed: () => Navigator.pop(context, false), // popAndPushNamed(context, '/game'), // .pushNamed(context, '/game'),
    );
  }
}
