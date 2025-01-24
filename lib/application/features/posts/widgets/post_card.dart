import 'package:flutter/material.dart';
import 'package:post_app_flutter/domain/entities/post_entity.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  final int index;
  const PostCard({
    super.key,
    required this.post,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Center(
                child: Text('${index + 1}'),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: themeData.textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    post.body,
                    style: themeData.textTheme.bodyMedium,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
