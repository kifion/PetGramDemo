import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petgram/app_theme.dart';
import 'package:petgram/localization/app_localization.dart';
import 'package:petgram/localization/support_languages.dart';
import 'package:petgram/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'domain/api_service.dart';
import 'localization/local_constant.dart';

class PetGramApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_PetGramAppState>();
    state.setLocale(newLocale);
  }

  @override
  _PetGramAppState createState() => _PetGramAppState();
}

class _PetGramAppState extends State<PetGramApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme,
      home: MultiProvider(
        providers: [
          Provider<ApiService>(
            create: (_) => ApiService.create(),
            dispose: (context, ApiService service) => service.client.dispose(),
          ),
        ],
        child: HomeScreen(),
      ),
      locale: _locale,
      supportedLocales: [
        Locale(SupportLanguages.English, ''),
        Locale(SupportLanguages.Russian, ''),
      ],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale?.languageCode == locale?.languageCode &&
              supportedLocale?.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales?.first;
      },
    );
  }
}
