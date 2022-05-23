import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  Future<String> _initVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(
            flex: 3,
          ),
          Center(
            child: Transform.rotate(
              angle: -0.05,
              child: Column(
                children: [
                  const Text(
                    'Pišiškvorky',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 55,
                      height: 1,
                    ),
                  ),
                  FutureBuilder<String>(
                    future: _initVersion(),
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      String? text = '';
                      if (snapshot.hasData) {
                        text = snapshot.data;
                      }
                      return Text(
                        'Verze: ${text ?? ''}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 100.0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game');
                  },
                  child: const Text(
                    'Hra',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: const Text(
                    'Nastavení',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
