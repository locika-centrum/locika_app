import 'package:flutter/material.dart';

class SecretButton extends StatelessWidget {
  // set to 0.0 in final version to hide the secret button
  static const _opacity = 0.1;

  const SecretButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity,
      child: FloatingActionButton(onPressed: () {
        _showOptions(context);
      }),
    );
  }

  void _showOptions(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Čas na pauzu?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Zpět')),
              TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/choices');
                  },
                  child: const Text('OK')),
            ],
          );
        });
  }
}
