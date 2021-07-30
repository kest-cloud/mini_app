import 'package:flutter/material.dart';
import 'package:mini_app/blogapi/postapi.dart';
//import 'package:mini_app/models/postmodel.dart';

import 'postdetails.dart';

class PostListPage extends StatefulWidget {
  @override
  PostListPageState createState() => PostListPageState();
}

class PostListPageState extends State<PostListPage> {
  //DateTime now = new DateTime.now();

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
              //padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    child: Container(
                      //color: Colors.orangeAccent,
                      child: Column(
                        children: [
                          Text(
                            snapshot.data![index].title,
                            style: (TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 10.0),
                          Text(snapshot.data![index].body),
                          SizedBox(height: 15.0),
                          Text(
                            "Time of post: ",
                            style: TextStyle(fontSize: 13),
                          ),
                          SizedBox(height: 25.0),
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
                              builder: (context) => PostDetails(
                                  userId: snapshot.data![index].id)));
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
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
