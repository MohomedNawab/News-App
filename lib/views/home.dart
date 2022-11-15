import 'package:flutter/material.dart';
import 'package:untitled2/helper/data.dart';
import 'package:untitled2/helper/news.dart';
import 'package:untitled2/models/article_model.dart';
import 'package:untitled2/models/category_model.dart';
import 'package:untitled2/views/article_list.dart';
import 'package:untitled2/views/category_list.dart';
import 'package:untitled2/views/blog_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategory();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
        child: Container(
          child: const CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: <Widget>[
              /// Categories
              CategoryList(
                categories: categories,
              ),

              /// Blogs
              ArticleList(
                articles: articles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}