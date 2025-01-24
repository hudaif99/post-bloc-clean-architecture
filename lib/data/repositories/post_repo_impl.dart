import 'package:post_app_flutter/data/datasources/post_remote_datasource.dart';
import 'package:post_app_flutter/domain/entities/post_entity.dart';
import 'package:post_app_flutter/domain/repositories/post_repository.dart';

class PostRepoImpl implements PostRepo {
  PostRemoteDatasource postRemoteDatasource = PostRemoteDataSourceImpl();

  @override
  Future<List<PostEntity>> getPostFromDataSource() async {
    final posts = await postRemoteDatasource.getPostFromApi();
    return posts;
  }
}
