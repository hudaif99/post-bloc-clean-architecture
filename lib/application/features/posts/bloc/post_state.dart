part of 'post_bloc.dart';

@immutable
sealed class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoadingState extends PostState {}

final class PostLoadedState extends PostState {
  final List<PostEntity> posts;

  PostLoadedState({required this.posts});

  @override
  List<Object?> get props => [posts];
}

final class PostEmptyState extends PostState {}

final class PostErrorState extends PostState {
  final String message;

  PostErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
