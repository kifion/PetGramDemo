import 'package:flutter/material.dart';
import 'package:petgram/data/model/language_data.dart';
import 'package:petgram/localization/app_localization.dart';
import 'package:petgram/localization/local_constant.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  _buildLanguageDropdownList() {
    return DropdownButton<LanguageData>(
      hint: Text(AppLocalizations.of(context).translate("changeLanguage")),
      onChanged: (LanguageData language) {
        changeLanguage(context, language.languageCode);
      },
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (item) => DropdownMenuItem<LanguageData>(
              value: item,
              child: Row(
                children: [Text(item.name)],
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildLanguageDropdownList(),
          ),
        ],
      ),
    );
  }
}
