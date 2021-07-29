//import 'dart:convert';

class Post {
  int id;
  String title;
  String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"] as int,
      title: json["title"] as String,
      body: json["body"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
    };
  }
}
