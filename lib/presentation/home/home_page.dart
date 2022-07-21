import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/post.dart';
import '../../utils/content_util.dart';
import 'post_tile.dart';

class HomePage extends StatelessWidget {
  final ValueChanged<String> onTapped;

  const HomePage({Key? key, required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(100),
      width: kIsWeb ? 1300 : double.infinity,
      child: FutureBuilder<List<Post>>(
        builder: (context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final posts = future.data ?? [];

          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 48,
              crossAxisSpacing: 48,
              crossAxisCount: 3,
              childAspectRatio: 324 / 523,
            ),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostTile(post: post);
            },
          );
        },
        future: ContentUtil.getPosts(),
      ),
    );
  }
}
