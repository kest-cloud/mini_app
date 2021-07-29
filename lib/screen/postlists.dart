import 'package:flutter/material.dart';
import 'package:mini_app/blogapi/postapi.dart';

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
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        future: postAPI.findAll(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data![index].title),
                    subtitle: Text(snapshot.data![index].body),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PostDetails(id: snapshot.data![index].id),
                        ),
                      );
                    },
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
