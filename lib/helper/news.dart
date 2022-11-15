import 'dart:convert';
import 'package:untitled2/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/views/home.dart';

class News{
  List<ArticleModel> news = [];

Future<void> getNews() async{

  String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=a714340b5faf443ca54307ffb0feac93";

  var response = await http.get(Uri.parse(url));
  var jsonData = jsonDecode(response.body);
  if(jsonData['status']=="ok"){
    jsonData["articles"].forEach((element){
      if(element["urlToImage"] !=null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element["content"],
        );
        news.add(articleModel);
      }
    });
  }
}
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?category=&country=ph&category=business&apiKey=3699636a771049aca38ea30dd4ac1344';

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel =  ArticleModel(
            title: element['title'] as String,
            author: element['author'] as String,
            description: element['description'] as String,
            url: element['url'] as String,
            urlToImage: element['urlToImage'] as String,
            content: element['content'] as String,
          );

          news.add(articleModel);
        }
      });
    }
  }
}