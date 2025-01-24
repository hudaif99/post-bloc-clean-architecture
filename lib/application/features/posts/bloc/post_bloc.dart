import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:post_app_flutter/domain/entities/post_entity.dart';
import 'package:post_app_flutter/domain/usecases/post_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestedEvent>(_onPostRequestEvent);
  }

  void _onPostRequestEvent(
      PostRequestedEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingState());
    try {
      final posts = await PostUsecase().getPostFromDataSource();
      if (posts.isNotEmpty) {
        emit(PostLoadedState(posts: posts));
      } else {
        emit(PostEmptyState());
      }
    } catch (e) {
      emit(PostErrorState(message: 'Failed to load posts'));
      log(e.toString());
    }
  }
}
