import 'package:flutter/material.dart';
import 'package:mini_app/models/postmodel.dart';
import '../blogapi/postapi.dart';

class PostProvider extends ChangeNotifier {
  String message = '';
  bool loading = true;

  List<Post> posts = [];

  void getAllPost() async {
    PostAPI postAPI = PostAPI();
    posts = await postAPI.findAll();
    loading = false;
    notifyListeners();
  }

  void deletePost(postid) async {
    try {
      message = 'deleting post...';
      notifyListeners();
      print("Deleting post..");
      PostAPI postAPI = PostAPI();
      var res = await postAPI.deletePost(postid.toString());

      print("DeleteResponse: $res");
      message = 'Post Deleted successfully';
      notifyListeners();
    } catch (error) {
      print("Error: $error");
      message = 'Error: $error';
      notifyListeners();
    }
  }

  void ratePost(int postId, int rating) {
    posts[postId].rating = rating;
    notifyListeners();
  }

  PostProvider() {
    getAllPost();
  }
}
