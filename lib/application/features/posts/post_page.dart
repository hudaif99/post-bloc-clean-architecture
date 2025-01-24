import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app_flutter/application/core/services/theme_service.dart';
import 'package:post_app_flutter/application/features/posts/bloc/post_bloc.dart';
import 'package:post_app_flutter/application/features/posts/widgets/post_card.dart';
import 'package:provider/provider.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: PostPage(),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostRequestedEvent());
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post app',
          style: themeData.textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<PostBloc>().add(PostRequestedEvent());
            },
            icon: Icon(
              Icons.refresh,
            ),
          ),
          Switch(
            activeColor: Colors.green,
            trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
            inactiveTrackColor: Colors.blueGrey,
            inactiveThumbColor: Colors.black87,
            padding: EdgeInsets.symmetric(horizontal: 16),
            value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeServiceProvider>(context, listen: false)
                  .toggleTheme();
            },
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
              child: Text(
                'All posts',
                style: themeData.textTheme.displayLarge,
              ),
            ),
            Expanded(
              child: BlocConsumer<PostBloc, PostState>(
                listener: (context, state) async {
                  if (state is PostErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is PostInitial) {
                    return Center(
                      child: Text('Posts are waiting to be loaded.'),
                    );
                  } else if (state is PostLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  } else if (state is PostEmptyState) {
                    return Center(
                      child: Text('Sorry, there is no posts available.'),
                    );
                  } else if (state is PostLoadedState) {
                    return ListView.separated(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      itemBuilder: (context, index) {
                        return PostCard(
                          post: state.posts[index],
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      itemCount: state.posts.length,
                    );
                  }
                  return Center(
                    child: Text('Some error occured'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
