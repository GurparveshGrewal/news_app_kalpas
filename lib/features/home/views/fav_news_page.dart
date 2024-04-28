import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_kalpas/core/commons/widgets/loader.dart';
import 'package:news_app_kalpas/core/utils/show_snackbar.dart';
import 'package:news_app_kalpas/features/home/views/bloc/home_bloc.dart';
import 'package:news_app_kalpas/features/home/views/widgets/article_card.dart';

class FavNewsPage extends StatefulWidget {
  const FavNewsPage({super.key});

  @override
  State<FavNewsPage> createState() => _FavNewsPageState();
}

class _FavNewsPageState extends State<FavNewsPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeFetchFavNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFavNewsFetchFailureState) {
            showSnackBar(
              context,
              'Something went wrong',
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) return const Loader();

          if (state is HomeFavNewsFetchSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: state.articles.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: NewsCard(
                              isFromFavsPage: true,
                              newsData: state.articles[index]),
                        );
                      })
                  : const Center(
                      child: Text(
                          'You don\'t have any favorite articles!\nTry adding by swiping news card'),
                    ),
            );
          }

          return const Center(
            child: Text("We are fetching latest articles"),
          );
        },
      ),
    );
  }
}
