//import 'dart:convert';

class Comments {
  int? id;
  String name;
  String email;
  String body;

  Comments(
      {required this.name,
      required this.email,
      required this.body,
      required this.id});

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      id: json["id"] as int,
      name: json["name"] as String,
      email: json["email"] as String,
      body: json["body"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "body": body,
    };
  }
}
