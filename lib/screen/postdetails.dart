import 'package:flutter/material.dart';
import 'package:mini_app/blogapi/postapi.dart';
import 'package:mini_app/models/postmodel.dart';

class PostDetails extends StatefulWidget {
  int id;

  PostDetails({Key? key, required this.id}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    var postAPI = new PostAPI();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Blog"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: postAPI.find(widget.id),
          builder: (context, AsyncSnapshot<Post> snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data!.id.toString()),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(snapshot.data!.title),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(snapshot.data!.body),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Update Post",
                        ),
                      ),
                      SizedBox(width: 20.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Delete Post",
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your email'),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your comment'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Post Comment",
                    ),
                  )
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
