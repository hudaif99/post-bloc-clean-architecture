import 'dart:convert';

import 'package:post_app_flutter/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDatasource {
  Future<List<PostModel>> getPostFromApi();
}

class PostRemoteDataSourceImpl implements PostRemoteDatasource {
  final client = http.Client();

  @override
  Future<List<PostModel>> getPostFromApi() async {
    try {
      final response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {'content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseBody = jsonDecode(response.body);
        final List<PostModel> posts =
            responseBody.map((json) => PostModel.fromJson(json)).toList();
        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
