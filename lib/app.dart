import 'package:flutter/material.dart';

import 'package:mini_app/screen/postlists.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Blog"),
      ),
      body: PostListPage(),
    );
  }
}
