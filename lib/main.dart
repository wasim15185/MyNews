import 'package:flutter/material.dart';
import 'package:mynewsapp/pages/HomeScreen.dart';
import 'package:mynewsapp/pages/NewsScreen.dart';
import 'package:mynewsapp/theme/maintheme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: myThemeLight,
      darkTheme: myThemeDark,
      initialRoute: HomeScreen.routeName,
      routes:   {
        HomeScreen.routeName : (context) => const HomeScreen(title: 'MyNews') ,
        NewsScreen.routeName:(context) =>   NewsScreen(title: 'MyNews'  )
      },
    );
  }
}



