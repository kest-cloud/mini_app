import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:mini_app/models/postmodel.dart';
import 'package:mini_app/screen/Create_Posts.dart';

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

  // ignore: non_constant_identifier_names
  Future createPost(Post post) async {
    final response = await http.post(
      Uri.parse('$url/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );
    print(response);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to create new Post.');
    }
  }

  Future updatePost(Post post) async {
    final response = await http.post(
      Uri.parse('$url/posts/${post.id!}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );
    print(response);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to update Post.');
    }
  }

  Future<Post> deletePost(String userId) async {
    final http.Response response = await http.delete(
      Uri.parse('$url/posts/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      // then throw an exception.
      throw Exception('Failed to Delete Post.');
    }
  }
}
