import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_kalpas/core/utils/functions.dart';
import 'package:news_app_kalpas/features/home/domain/entity/news_entity.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsDataEntity newsData;
  const NewsDetailsPage({
    super.key,
    required this.newsData,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leadingWidth: MediaQuery.of(context).size.width * 0.5,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 30,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text(
                  'Back',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                            height: height * 0.25,
                            width: double.infinity,
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
                        height: 10,
                      ),
                      Flexible(
                        child: Text(
                          newsData.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Text(
                        newsData.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                    ],
                  ),
                ),
                if (newsData.isFavorite)
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.005,
                      right: 20,
                      child: const Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red,
                        size: 30,
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
