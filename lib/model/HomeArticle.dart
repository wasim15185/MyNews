import 'dart:convert';

HomeArticle homeArticleFromJson(String str) =>
    HomeArticle.fromJson(json.decode(str));

class HomeArticle {
  HomeArticle({
    required this.articles,
  });

  List<Article> articles;

  factory HomeArticle.fromJson(Map<String, dynamic> json) => HomeArticle(
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  Article({
    this.author,
    required this.title,
    required this.description,
    required this.url,
     this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  String? author;
  String title;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}
