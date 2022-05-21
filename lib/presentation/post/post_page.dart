import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../router/app_router_state.dart';
import '../app/app_content.dart';
import '../main/main_scaffold.dart';
import '../not_found/not_found_page.dart';

class PostPage extends Page {
  final String slug;

  const PostPage({LocalKey? key, required this.slug}) : super(key: key);

  @override
  String? get name => '/$slug';

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        pageBuilder: (context, animation, secondaryAnimation) {
          final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
          final curveTween = CurveTween(curve: Curves.easeInOut);
          final post = AppContent().bySlug(slug);
          final nextPost = AppContent().nextPost(slug);
          final prevPost = AppContent().prevPost(slug);
          return SlideTransition(
            position: animation.drive(curveTween).drive(tween),
            child: MainScaffold(
              child: post != null
                  ? Column(
                      children: [
                        MarkdownBody(data: post.content),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: prevPost == null
                                  ? null
                                  : () => AppRouterState()
                                      .goToPostPage(prevPost.id),
                              child: Text(prevPost == null
                                  ? 'No Prev'
                                  : prevPost.meta.title),
                            ),
                            ElevatedButton(
                              onPressed: nextPost == null
                                  ? null
                                  : () => AppRouterState()
                                      .goToPostPage(nextPost.id),
                              child: Text(nextPost == null
                                  ? 'No Next'
                                  : nextPost.meta.title),
                            )
                          ],
                        )
                      ],
                    )
                  : const NotFoundPage(),
            ),
          );
        });
  }
}
