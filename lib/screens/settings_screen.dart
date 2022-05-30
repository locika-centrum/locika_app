import 'package:flutter/material.dart';

import '../widgets/settings_list_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Nastavení',
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(25),
            width: double.infinity,
            child: Column(
              children: const [
                SettingsListItem('Velikost hry', 'game_size',),
                SettingsListItem('Složitost', 'game_complexity',),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 100.0),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Zpět',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
