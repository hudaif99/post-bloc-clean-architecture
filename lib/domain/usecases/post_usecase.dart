import 'package:post_app_flutter/data/repositories/post_repo_impl.dart';
import 'package:post_app_flutter/domain/entities/post_entity.dart';
import 'package:post_app_flutter/domain/repositories/post_repository.dart';

class PostUsecase {
  PostRepo postRepo = PostRepoImpl();

  Future<List<PostEntity>> getPostFromDataSource() async {
    final posts = postRepo.getPostFromDataSource();

    return posts;
  }
}
