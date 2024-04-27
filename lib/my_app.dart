import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_kalpas/core/app_theme.dart';
import 'package:news_app_kalpas/features/home/views/bloc/home_bloc.dart';
import 'package:news_app_kalpas/features/home/views/main_screen.dart';
import 'package:news_app_kalpas/init_dependencies.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData().themeData,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => serviceLocator<HomeBloc>()),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
