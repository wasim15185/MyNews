 import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = '/home/news';

  const NewsScreen({
    super.key,
    required this.title,
    /*required this.url*/
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  // final String url ;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgUrl = ModalRoute.of(context)!.settings.arguments as String;
    print("routeArg: $routeArgUrl");

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
          child: WebView(
            initialUrl: routeArgUrl,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
