import 'package:flutter/material.dart';
import 'package:my_trainings/core/theme/theme.dart';
import 'package:my_trainings/pages/home/home_page.dart';

class TrainingsApp extends StatelessWidget {
  const TrainingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightThemeMode,
      home: HomePage(),
    );
  }
}
