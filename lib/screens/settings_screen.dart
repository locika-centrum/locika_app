import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Nastavení',
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Text('Nějaké nastavení ...'),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Zpět',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
