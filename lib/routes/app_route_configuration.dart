import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_kalpas/core/commons/widgets/error_page.dart';
import 'package:news_app_kalpas/features/home/domain/entity/news_entity.dart';
import 'package:news_app_kalpas/features/home/views/main_screen.dart';
import 'package:news_app_kalpas/features/home/views/news_details_page.dart';
import 'package:news_app_kalpas/routes/app_route_constants.dart';

class MyAppRouter {
  static GoRouter returnRouter() {
    GoRouter route = GoRouter(
        routes: [
          GoRoute(
              name: MyAppRoutesConstants.homePageRouteName,
              path: '/',
              pageBuilder: (context, state) {
                return const MaterialPage(child: MainScreen());
              }),
          GoRoute(
              name: MyAppRoutesConstants.newsDetailsPageRouteName,
              path: '/news_details_page',
              pageBuilder: (context, state) {
                return MaterialPage(
                    child: NewsDetailsPage(
                        newsData: state.extra as NewsDataEntity));
              }),
        ],
        errorPageBuilder: (context, state) {
          return const MaterialPage(child: ErrorPage());
        });
    return route;
  }
}
