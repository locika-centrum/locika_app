import 'package:flutter/material.dart';

import '../providers/theme_provider.dart';
import '../widgets/home_navigation.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.violetTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chat',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: Text('Tady bude Chat'),
        ),
        bottomNavigationBar: const HomeNavigation(),
      ),
    );
  }
}
