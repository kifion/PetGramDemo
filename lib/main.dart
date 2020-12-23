import 'package:flutter/material.dart';
import 'package:fimber/fimber.dart';
import 'app.dart';

/**
 * 1) Settings with multi languages
 */

void main() {
  Fimber.plantTree(DebugTree());
  runApp(PetGramApp());
  Fimber.plantTree(DebugTree.elapsed());
}