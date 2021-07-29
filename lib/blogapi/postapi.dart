import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:mini_app/models/postmodel.dart';

class PostAPI {
  String url = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> findAll() async {
    var response = await http.get(Uri.parse('$url/posts'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      return body.map((posts) => Post.fromJson(posts)).toList();
      // return body.fromJson(jsonDecode(response.body));
      //return body.map((posts) => Post.fromJson(posts));
    } else {
      throw Exception("Fail to create a Post");
    }
  }

  Future<Post> find(int id) async {
    // ignore: unnecessary_brace_in_string_interps
    var response = await http.get(Uri.parse('$url/posts/${id}'));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fail to create a Post");
    }
  }
}
