import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_kalpas/core/commons/custom_button.dart';
import 'package:news_app_kalpas/core/commons/widgets/loader.dart';
import 'package:news_app_kalpas/core/utils/show_snackbar.dart';
import 'package:news_app_kalpas/features/home/views/bloc/home_bloc.dart';

class AllNewsPage extends StatefulWidget {
  const AllNewsPage({super.key});

  @override
  State<AllNewsPage> createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeFetchNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeNewsFetchFailureState) {
            showSnackBar(
              context,
              'Something went wrong',
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) return const Loader();

          if (state is HomeNewsFetchSuccessState) {
            return Center(
              child: Text(
                state.articles.length.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }

          return Center(
            child: Column(
              children: [
                const Text('All News'),
                CustomButton(onTap: () {}, title: 'get News'),
              ],
            ),
          );
        },
      ),
    );
  }
}
