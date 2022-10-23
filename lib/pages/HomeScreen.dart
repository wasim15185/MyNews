import 'package:flutter/material.dart';
import 'package:mynewsapp/pages/NewsScreen.dart';
import '../Repository/articleRepository.dart';
import '../model/HomeArticle.dart';
import '../theme/allovertheme.dart';
import '../widget/chipswithContainer.dart';
import '../widget/homeCard.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Article> homeArticles = DemoUtils.getDemoData();
  List<Article> homeArticles = [];

  var listSize = 0;

  void getNews(String data) async {
    ArticleRepository repository = ArticleRepository();
    try {
      homeArticles = await repository.getHomeArticleNews(data);
      setState(() {
        listSize = homeArticles.length;
      });
      print('homeArticles fetched list is ${homeArticles.length}');
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getNews("bitcoin");
    // TODO: implement initState
    super.initState();
    print('then inited state');
  }

  void naviGateToNewsScreen(BuildContext context, Article article) {


    Navigator.of(context)
        .pushNamed(NewsScreen.routeName, arguments: article.url);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title.toUpperCase(),
            style: const TextStyle(
              fontSize: 17.0,
              letterSpacing: 1.5,
            ),
          ),
        ),
        body: SafeArea(
            child: Container(
          color: containerBackGround(context),
          child: Column(
            children: [
              ChipsWithContainer(
                callback: (str) {
                  getNews(str);
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: homeArticles.length,
                    itemBuilder: (ctx, index) {
                      var article = homeArticles[index];

                      return HomeCard(
                        clickListener: (str) {
                          naviGateToNewsScreen(context,article);
                        },
                        key: Key(index.toString()),
                        title: article.title,
                        author: article.author,
                        description: article.description,
                        url: article.url,
                        urlToImage: article.urlToImage,
                        publishedAt: article.publishedAt,
                        content: article.content,
                      );
                    }),
              ),
            ],
          ),
        ))

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
