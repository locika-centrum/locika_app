import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../providers/settings.dart';

class SettingsListItem extends StatefulWidget {
  final String title;
  final String paramName;

  const SettingsListItem(this.title, this.paramName, {Key? key})
      : super(key: key);

  @override
  State<SettingsListItem> createState() => _SettingsListItemState();
}

class _SettingsListItemState extends State<SettingsListItem> {
  late Future<int> _buildIndexData;
  late int _index = 0;

  @override
  initState() {
    _buildIndexData = _fetchPreferenceValue(widget.paramName);

    super.initState();
  }

  Future<int> _fetchPreferenceValue(String key) async {
    int result = 0;

    result = await AppPreferences().getOptionPreferenceIndex(key);
    _index = result;
    return result;
  }

  void _increaseOption(String key) {
    Map options = AppPreferences.optionPreferences
        .firstWhere((element) => element['key'] == key);

    if (_index < options['values'].length - 1) {
      _index++;
      AppPreferences().setOptionPreference(key, _index);
      Function.apply(options['callback'], [], options['params'][_index]);

      setState(() {});
    }
  }

  void _decreaseOption(String key) {
    Map options = AppPreferences.optionPreferences
        .firstWhere((element) => element['key'] == key);

    if (_index > 0) {
      _index--;
      AppPreferences().setOptionPreference(key, _index);
      Function.apply(options['callback'], [], options['params'][_index]);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: _buildIndexData,
      builder: (context, snapshot) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: TextButton(
                        onPressed: () => _decreaseOption(widget.paramName),
                        child: const Text('<'),
                      ),
                    ),
                    Text(AppPreferences.optionPreferences.firstWhere((element) =>
                    element['key'] == widget.paramName)['values'][_index]),
                    SizedBox(
                      width: 50,
                      child: TextButton(
                        onPressed: () => _increaseOption(widget.paramName),
                        child: const Text('>'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
