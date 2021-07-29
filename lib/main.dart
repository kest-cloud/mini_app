import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(BlogApp());
}

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Blog App",
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: MyApp(),
    );
  }
}
