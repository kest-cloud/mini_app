import 'package:flutter/material.dart';
import 'package:mini_app/blogapi/postapi.dart';
import 'package:mini_app/models/postmodel.dart';
import 'package:provider/provider.dart';

class CreatePostProvider extends ChangeNotifier {
  String message = '';
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerBody = TextEditingController();
  TextEditingController controllerUserId = TextEditingController();
  TextEditingController controllerId = TextEditingController();

  void createPost() async {
    message = 'creating post...';
    notifyListeners();
    print("PostBody: ${controllerBody.text}");
    print("postTitle: ${controllerTitle.text}");
    print("postUserId: ${controllerUserId.text}");
    print("postId:       ${controllerId.text}");

    try {
      PostAPI postApi = PostAPI();
      Post post = Post(
          userId: int.parse(controllerUserId.text),
          title: controllerTitle.text,
          body: controllerBody.text,
          id: null);
      var res = await postApi.createPost(post);
      print("CreatePostRes: $res");
      message = "Post created successfully";
      notifyListeners();
    } catch (error) {
      message = "Error: $error";
      notifyListeners();
    }
  }

  void updatePost() async {
    message = 'updating post...';
    notifyListeners();
    print("PostBody: ${controllerBody.text}");
    print("postTitle: ${controllerTitle.text}");
    print("postUserId: ${controllerUserId.text}");
    print("postId:       ${controllerId.text}");

    try {
      PostAPI postApi = PostAPI();
      Post post = Post(
          userId: int.parse(controllerUserId.text),
          title: controllerTitle.text,
          body: controllerBody.text,
          id: null);
      var res = await postApi.createPost(post);
      print("CreatePostRes: $res");
      message = "Post created successfully";
      notifyListeners();
    } catch (error) {
      message = "Error: $error";
      notifyListeners();
    }
  }

  void setUpEdit(Post post) {
    controllerTitle.text = post.title;
    controllerBody.text = post.body;
    controllerId.text = post.id.toString();
    controllerUserId.text = post.userId.toString();
    notifyListeners();
  }
}
