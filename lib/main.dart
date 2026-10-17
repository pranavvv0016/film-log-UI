import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const RollApp());
}

class RollApp extends StatelessWidget {
  const RollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: const SplashScreen(),
    );
  }
}
