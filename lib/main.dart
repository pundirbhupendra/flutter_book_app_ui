import 'package:flutter/material.dart';

import 'package:flutter_book_app_ui/pages/home.dart';
import 'package:flutter_book_app_ui/provider/book_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
 ChangeNotifierProvider(
     create: (_) =>BookProvider(),
   child:
    MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
