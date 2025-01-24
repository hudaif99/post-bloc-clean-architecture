import 'package:post_app_flutter/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({required title, required body, required id, required userId})
      : super(id: id, body: body, title: title, userId: userId);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'],
      body: json['body'],
      id: json['id'],
      userId: json['userId'],
    );
  }
}
