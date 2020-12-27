import 'package:flutter/material.dart';

import '../settings/settings_screen.dart';

class SettingsButtonWidget extends StatelessWidget {
  void _navigateToSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      onPressed: () {
        _navigateToSettings(context);
      },
    );
  }
}
