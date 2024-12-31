import 'package:flutter/material.dart';
import 'package:news_app/view/login/login_page.dart';
import 'package:provider/provider.dart';
import 'controllers/news_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsController(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const LoginScreen(),
    );
  }
}