import 'package:mynewsapp/utils/urlUtil.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/HomeArticle.dart';

class ArticleRepository {


  Future<List<Article>> getHomeArticleNews(String topic) async {
    var client = http.Client();
    String urlString = UrlUtil.getEveryThinkUrl(topic);
    var url = Uri.parse(urlString);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var json = response.body;
      var data = homeArticleFromJson(json);
      // print(data) ;
      return data.articles ;


    } else {

      print("Did not fetch from this $url");

      throw Exception(" Did not fetch data ") ;

    }
  }
}

