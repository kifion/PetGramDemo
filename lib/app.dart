import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/api_service.dart';
import 'presentation/start_screen.dart';

class PetGramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          Provider<ApiService>(
            create: (_) => ApiService.create(),
            dispose: (context, ApiService service) => service.client.dispose(),
          ),
        ],
        child: MaterialApp(home: StartScreen()),
      ),
    );
  }
}
