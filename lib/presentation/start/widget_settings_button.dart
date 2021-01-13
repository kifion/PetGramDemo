import 'package:flutter/material.dart';
import 'package:petgram/localization/app_localization.dart';

class SettingsButtonWidget extends StatelessWidget {
  void _navigateToSettings(BuildContext context) {
    _showInSnackBar(context, AppLocalizations.of(context).translate('buttonSearchClicked'));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.search,
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
