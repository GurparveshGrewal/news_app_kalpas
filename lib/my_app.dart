import 'package:flutter/material.dart';
import 'package:news_app_kalpas/core/app_theme.dart';
import 'package:news_app_kalpas/routes/app_route_configuration.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyAppRouter.returnRouter(),
      theme: AppThemeData().themeData,
    );
  }
}
