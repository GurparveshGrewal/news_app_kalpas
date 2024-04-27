import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_kalpas/core/commons/custom_button.dart';
import 'package:news_app_kalpas/core/utils/functions.dart';
import 'package:news_app_kalpas/core/utils/show_snackbar.dart';
import 'package:news_app_kalpas/features/home/domain/entity/news_entity.dart';
import 'package:news_app_kalpas/features/home/views/bloc/home_bloc.dart';
import 'package:news_app_kalpas/features/home/views/news_details_page.dart';

class NewsCard extends StatelessWidget {
  final NewsDataEntity newsData;
  final bool isFromFavsPage;
  const NewsCard({
    required this.newsData,
    this.isFromFavsPage = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => NewsDetailsPage(newsData: newsData)));
      },
      child: Dismissible(
        key: UniqueKey(),
        direction: isFromFavsPage
            ? DismissDirection.none
            : DismissDirection.endToStart,
        dragStartBehavior: DragStartBehavior.start,
        confirmDismiss: (_) async {
          final confirmed = await showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: const Text(
                  'Add Article to Favorites',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                content: const Text(
                  'Do you want to add this article to Favs?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                actions: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey.shade800),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          title: 'Add to Favs',
                          onTap: () {
                            context
                                .read<HomeBloc>()
                                .add(HomeAddNewsToFavsEvent(newsData));
                            showSnackBar(context,
                                'Successfully added article to the Favorites');
                            Navigator.of(context).pop(false);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
          );
          return confirmed;
        },
        background: Container(
          color: Colors.red.withOpacity(0.5),
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: double.infinity,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      color: Colors.red,
                      CupertinoIcons.heart_fill,
                      size: 30,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Add to Favorite',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        child: Container(
          height: height * 0.18,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      height: height * 0.12,
                      width: width * 0.25,
                      child: newsData.imageURL != null
                          ? CachedNetworkImage(
                              key: UniqueKey(),
                              imageUrl: newsData.imageURL!,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/default_article_image.jpg',
                              fit: BoxFit.cover,
                            )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsData.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Text(
                            newsData.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: FittedBox(
                            child: Row(
                              children: [
                                Icon(
                                  size: 20,
                                  Icons.calendar_month_rounded,
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                Text(
                                  convertDateToReadable(newsData.publishedAt),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline
                                        .withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
