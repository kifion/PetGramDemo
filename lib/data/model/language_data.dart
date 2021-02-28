import 'package:petgram/localization/support_languages.dart';

class LanguageData {
  final String name;
  final String languageCode;

  LanguageData(this.name, this.languageCode);

  static List<LanguageData> languageList() {
    return <LanguageData>[
      LanguageData("English", SupportLanguages.English),
      LanguageData("Russian", SupportLanguages.Russian),
    ];
  }
}
