import 'package:flutter/material.dart';

import 'package:mini_app/screen/Create_Posts.dart';
import 'package:mini_app/screen/postlists.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(BlogApp());
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
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Create Post"),
                  value: 1,
                ),
              ],
              onSelected: (int menu) {
                navigator.currentState!.push(
                  MaterialPageRoute(
                    builder: (context) => CreatePosts(),
                  ),
                );
              },
            )
          ],
        ),
        body: PostListPage(),
      ),
    );
  }
}
