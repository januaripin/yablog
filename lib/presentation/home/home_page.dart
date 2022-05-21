import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/post.dart';
import '../../router/app_router_state.dart';
import '../../utils/content_util.dart';

class HomePage extends StatelessWidget {
  final ValueChanged<String> onTapped;

  const HomePage({Key? key, required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          width: kIsWeb ? 960 : double.infinity,
          child: FutureBuilder<List<Post>>(
            builder: (context, future) {
              if (future.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final posts = future.data ?? [];

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return GestureDetector(
                    onTap: () => AppRouterState().goToPostPage(post.id),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(post.meta.title),
                            const Spacer(),
                            Text(post.meta.date.toString()),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            future: ContentUtil.getPosts(),
          ),
        ),
      ),
    );
  }
}
