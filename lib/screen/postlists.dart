import 'package:flutter/material.dart';
import 'package:mini_app/blogapi/postapi.dart';
import 'package:mini_app/models/postmodel.dart';

import 'postdetails.dart';

class PostListPage extends StatefulWidget {
  @override
  PostListPageState createState() => PostListPageState();
}

class PostListPageState extends State<PostListPage> {
  @override
  Widget build(BuildContext context) {
    var postAPI = new PostAPI();
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: FutureBuilder(
        future: postAPI.findAll(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(snapshot.data![index].title),
                      subtitle: Text(snapshot.data![index].body),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PostDetails(userId: snapshot.data![index].id),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
