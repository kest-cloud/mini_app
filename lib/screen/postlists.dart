import 'package:flutter/material.dart';
import 'package:mini_app/blogapi/postapi.dart';
import 'package:provider/provider.dart';
import '../models/postmodel.dart';
import '../provider/postprovider.dart';
import 'Create_Posts.dart';
//import 'package:mini_app/models/postmodel.dart';

import 'Create_Posts.dart';
import 'postdetails.dart';

class PostListPage extends StatefulWidget {
  @override
  PostListPageState createState() => PostListPageState();
}

class PostListPageState extends State<PostListPage> {
  DateTime now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    var postAPI = new PostAPI();
    return Scaffold(
        body: Column(children: [
      TextButton(
          child: Text('Create Post'),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreatePosts(),
              )) // Put the create post here
          ),
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Consumer<PostProvider>(builder: (context, postProvider, child) {
          if (postProvider.loading) {
            return CircularProgressIndicator();
          }

          return ListView.builder(
            //padding: const EdgeInsets.all(8),
            itemCount: postProvider.posts.length,
            itemBuilder: (context, index) {
              Post post = postProvider.posts[index];
              return GestureDetector(
                  child: Container(
                    //color: Colors.orangeAccent,
                    child: Column(
                      children: [
                        Text(
                          post.title,
                          style: (TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 10.0),
                        Text(post.body),
                        SizedBox(height: 15.0),
                        Text(
                          "Time of post: ${now.year} / ${now.month} / ${now.day}   ${now.hour}:${now.minute}",
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(height: 25.0),
                        Text("Rating: ${post.rating}"),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: () => postProvider.ratePost(index, 1),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: (post.rating >= 1)
                                        ? Colors.green
                                        : Colors.grey,
                                  )),
                              InkWell(
                                onTap: () => postProvider.ratePost(index, 2),
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: (post.rating >= 2)
                                        ? Colors.green
                                        : Colors.grey),
                              ),
                              InkWell(
                                onTap: () => postProvider.ratePost(index, 3),
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: (post.rating >= 3)
                                        ? Colors.green
                                        : Colors.grey),
                              ),
                              InkWell(
                                onTap: () => postProvider.ratePost(index, 4),
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: (post.rating >= 4)
                                        ? Colors.green
                                        : Colors.grey),
                              ),
                              InkWell(
                                onTap: () => postProvider.ratePost(index, 5),
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: (post.rating >= 5)
                                        ? Colors.green
                                        : Colors.grey),
                              ),
                            ]),
                        const Divider(
                          color: Colors.blueGrey,
                          height: 20,
                          thickness: 5,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostDetails(userId: post.userId)));
                  });
              // return Card(
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: ListTile(
              //       title: Text(),
              //       subtitle: Text(),
              //       onTap: () {
              //         N
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // );
            },
          );
        }),
      ))
    ]));
  }
}
