import 'package:flutter/material.dart';
//import 'package:mini_app/blogapi/postapi.dart';

import 'package:mini_app/models/postmodel.dart';
import 'package:mini_app/provider/createpostprovider.dart';
import 'package:provider/provider.dart';
//import 'package:mini_app/screen/postdetails.dart';

import '../main.dart';

class CreatePosts extends StatefulWidget {
  CreatePosts({this.post});
  Post? post;
  @override
  CreatePostsState createState() => CreatePostsState();
}

class CreatePostsState extends State<CreatePosts> {
  Future<Post>? futurePost;

  @override
  Widget build(BuildContext context) {
    // var postAPI = new PostAPI();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Blog"),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: ChangeNotifierProvider(
              create: (context) => CreatePostProvider(),
              builder: (context, child) {
                return Consumer<CreatePostProvider>(
                  builder: (context, value, child) {
                    if (widget.post != null) {
                      value.setUpEdit(widget.post!);
                    }
                    return Column(
                      children: <Widget>[
                        Text("${value.message}"),
                        SizedBox(height: 200),
                        TextField(
                          controller: value.controllerUserId,
                          decoration:
                              const InputDecoration(hintText: 'Enter User Id'),
                        ),
                        TextField(
                          controller: value.controllerTitle,
                          decoration:
                              const InputDecoration(hintText: 'Enter Title'),
                        ),
                        TextField(
                          controller: value.controllerBody,
                          decoration:
                              const InputDecoration(hintText: 'Enter Body'),
                        ),
                        if (widget.post == null) ...[
                          ElevatedButton(
                              child: const Text('Create Data'),
                              onPressed: () => value.createPost()),
                        ],
                        if (widget.post != null) ...[
                          ElevatedButton(
                              child: const Text('Update Data'),
                              onPressed: () => value.updatePost()),
                        ],
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlogApp(),
                              ),
                            );
                          },
                          child: Text("cancel"),
                        )
                      ],
                    );
                  },
                );
              },
            )
            //child: (futurePost == null) ? buildFutureBuilder() : buildColumn(),
            ),
      ),
    );
  }
}

FutureBuilder<Post> buildFutureBuilder() {
  return FutureBuilder<Post>(
    //future: futurePost,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.title);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return const CircularProgressIndicator();
    },
  );
}
