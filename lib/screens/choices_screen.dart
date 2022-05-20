import 'package:flutter/material.dart';

import '../providers/theme_provider.dart';
import '../widgets/home_button.dart';

class ChoicesScreen extends StatelessWidget {
  const ChoicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.violetTheme,
      child: Scaffold(
        floatingActionButton: const HomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        appBar: AppBar(
          title: const Text('Krátké volby'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Tady budou krátké volby'),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/chat'),
                      child: const Text('Chat'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
