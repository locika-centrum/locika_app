import 'package:flutter/material.dart';

import '../providers/theme_provider.dart';
import '../widgets/home_navigation.dart';
import '../widgets/rich_button.dart';

const List<Map> _optionButtons = [
  {
    'icon': Icons.phone,
    'title': 'Volat',
    'subtitle': 'Okamžitá pomoc',
  },
  {
    'icon': Icons.chat,
    'title': 'Chat',
    'subtitle': 'Promluvit si Locika centrem',
    'redirect': '/chat',
  },
  {
    'icon': Icons.info,
    'title': 'Info',
    'subtitle': 'Jak rozeznat násilí',
  },
  {
    'icon': Icons.help,
    'title': 'Nápověda',
    'subtitle': 'Jak aplikace funguje',
  },
];

class ChoicesScreen extends StatefulWidget {
  const ChoicesScreen({Key? key}) : super(key: key);

  @override
  State<ChoicesScreen> createState() => _ChoicesScreen();
}

class _ChoicesScreen extends State<ChoicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.violetTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Krátké volby'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Text('Tady bude reklama na legrační trenýrky'),
            ),
            GridView.builder(
              itemCount: _optionButtons.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: _buildBoardItems,
            )
          ],
        ),
        bottomNavigationBar: const HomeNavigation(),
      ),
    );
  }
}

Widget _buildBoardItems(BuildContext context, int index) {
  return InkWell(
    onTap: () {
      switch (_optionButtons[index]['redirect']) {
        case null:
          return;
        default:
          Navigator.popAndPushNamed(context, _optionButtons[index]['redirect']);
      }
    },
    child: GridTile(
      child: RichButton(
        icon: _optionButtons[index]['icon'],
        title: _optionButtons[index]['title'],
        subtitle: _optionButtons[index]['subtitle'],
      ),
    ),
  );
}