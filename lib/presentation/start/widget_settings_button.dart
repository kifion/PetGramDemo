import 'package:flutter/material.dart';

class SettingsButtonWidget extends StatelessWidget {
  void _navigateToSettings(BuildContext context) {
    _showInSnackBar(context, "The button of settings was clicked");
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

  _showInSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
