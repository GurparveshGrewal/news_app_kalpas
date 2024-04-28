import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_kalpas/features/home/views/all_news_page.dart';
import 'package:news_app_kalpas/features/home/views/bloc/home_bloc.dart';
import 'package:news_app_kalpas/features/home/views/fav_news_page.dart';
import 'package:news_app_kalpas/init_dependencies.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (ctx) => serviceLocator<HomeBloc>()),
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.withOpacity(0.1),
                    ),
                    controller: _tabController,
                    labelColor: Theme.of(context).colorScheme.onBackground,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Icon(
                                Icons.list,
                                size: 30,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'News',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: FittedBox(
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.heart_fill,
                                  size: 30,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Favs',
                                ),
                              ],
                            ),
                          )),
                    ]),
                Expanded(
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: const [
                      AllNewsPage(),
                      FavNewsPage(),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
