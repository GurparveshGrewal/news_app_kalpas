import 'package:flutter/material.dart';
import 'package:news_app_kalpas/init_dependencies.dart';
import 'package:news_app_kalpas/my_app.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}
