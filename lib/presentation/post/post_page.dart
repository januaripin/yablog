import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../app/app_content.dart';
import '../main/main_scaffold.dart';
import '../not_found/not_found_page.dart';

class PostPage extends Page {
  final String slug;

  const PostPage(this.slug);

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
          return SlideTransition(
            position: animation.drive(curveTween).drive(tween),
            child: MainScaffold(
              child: post != null
                  ? MarkdownBody(data: post.content)
                  : const NotFoundPage(),
            ),
          );
        });
  }
}
