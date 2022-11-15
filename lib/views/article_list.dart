import 'package:flutter/material.dart';

import 'package:untitled2/models/article_model.dart';
import 'blog_tile.dart';

class ArticleList extends StatelessWidget {
  final List<ArticleModel> articles;

  const ArticleList({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: ListView.builder(
          itemCount: articles.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return BlogTile(
              imageUrl: articles[index].urlToImage,
              title: articles[index].title,
              desc: articles[index].description,
              url: articles[index].url,
            );
          }),
    );
  }
}