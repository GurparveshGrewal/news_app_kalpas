import 'package:flutter/material.dart';
import 'package:news_app_kalpas/core/commons/custom_button.dart';
import 'package:news_app_kalpas/core/wrappers/remote_services_wrapper.dart';
import 'package:news_app_kalpas/init_dependencies.dart';

class AllNewsPage extends StatefulWidget {
  const AllNewsPage({super.key});

  @override
  State<AllNewsPage> createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {
  final RemoteServicesWrapper _servicesWrapper =
      serviceLocator<RemoteServicesWrapper>();

  void getNews() async {
    await _servicesWrapper.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('All News'),
            CustomButton(onTap: getNews, title: 'get News'),
          ],
        ),
      ),
    );
  }
}
