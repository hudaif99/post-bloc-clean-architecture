import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String title;
  final String body;
  final int id;
  final int userId;

  const PostEntity({
    required this.title,
    required this.body,
    required this.id,
    required this.userId,
  });

  @override
  List<Object?> get props => [title, body, id, userId];
}
