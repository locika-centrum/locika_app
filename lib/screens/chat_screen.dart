import 'package:flutter/material.dart';

import '../providers/theme_provider.dart';
import '../widgets/home_button.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.violetTheme,
      child: Scaffold(
        floatingActionButton: HomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        appBar: AppBar(
          title: const Text('Chat'),
          automaticallyImplyLeading: false,
        ),
        body: const Center(
          child: Text('Tady bude Chat'),
        ),
      ),
    );
  }
}
