import 'package:flutter/material.dart';
import 'package:news_app_kalpas/core/app_theme.dart';
import 'package:news_app_kalpas/features/home/views/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData().themeData,
      home: const MainScreen(),
    );
  }
}
