part of 'post_bloc.dart';

@immutable
sealed class PostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostRequestedEvent extends PostEvent {}
