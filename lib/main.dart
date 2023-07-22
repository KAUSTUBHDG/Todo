import 'package:dosh/di/injector_config.dart';
import 'package:dosh/presentation/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectorConfig.setup();
  runApp(const MyApp());
}
