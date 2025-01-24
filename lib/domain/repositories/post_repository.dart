import 'package:post_app_flutter/domain/entities/post_entity.dart';

abstract class PostRepo {
  Future<List<PostEntity>> getPostFromDataSource();
}
