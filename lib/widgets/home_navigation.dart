import 'package:flutter/material.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Navigator.pop(context, false); },
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Container(
          color: Colors.deepPurple,
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: const Text(
                'Opustit můj režim',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
