import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../const/assets_path.dart';
import '../../domain/entity/post.dart';
import '../../router/app_router_state.dart';
import '../../utils/content_util.dart';
import '../../utils/gap.dart';
import '../app/app_themes.dart';

class HomePage extends StatelessWidget {
  final ValueChanged<String> onTapped;

  const HomePage({Key? key, required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
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
            return GestureDetector(
              onTap: () => AppRouterState().goToPostPage(post.id),
              child: SizedBox(
                width: 324,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 324,
                      height: 218,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        imageUrl: post.meta.featureImage,
                        fit: BoxFit.fitWidth,
                        errorWidget: (context, url, _) => Container(
                          color: Theme.of(context).colorScheme.background,
                          child: Center(
                            child: Image.asset(AssetsPath.abLogo),
                          ),
                        ),
                      ),
                    ),
                    Gap.p24(),
                    Text(
                      post.meta.date.toIso8601String(),
                      style: AppThemes.textTheme.labelSmall,
                    ),
                    Gap.p16(),
                    Text(
                      post.meta.title,
                      style: AppThemes.textTheme.headlineMedium,
                      maxLines: 3,
                    ),
                    Gap.p16(),
                    MarkdownBody(
                      data: post.content.substring(0, 200),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      future: ContentUtil.getPosts(),
    );
  }
}
