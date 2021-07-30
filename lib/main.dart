import 'package:flutter/material.dart';
import 'package:mini_app/provider/postprovider.dart';

import 'package:mini_app/screen/Create_Posts.dart';
import 'package:mini_app/screen/postlists.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => PostProvider())],
    child: BlogApp(),
  ));
}

// ignore: must_be_immutable
class BlogApp extends StatelessWidget {
  var navigator = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator,
      title: "Blog App",
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Blog"),
        ),
        body: PostListPage(),
      ),
    );
  }
}
