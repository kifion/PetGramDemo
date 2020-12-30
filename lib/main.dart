import 'package:flutter/material.dart';
import 'app.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  runApp(PetGramApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}