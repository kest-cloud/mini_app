//import 'dart:convert';

class Post {
  int? id;
  int userId;
  String title;
  String body;

  Post(
      {required this.userId,
      required this.title,
      required this.body,
      required this.id});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"] as int,
      userId: json["userId"] as int,
      title: json["title"] as String,
      body: json["body"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "body": body,
    };
  }
}
