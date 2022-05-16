import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../home/posts.dart';
import '../main/main_scaffold.dart';
import '../not_found/not_found_page.dart';
import 'selected_post.dart';

class PostPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        pageBuilder: (context, animation, secondaryAnimation) {
          final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
          final curveTween = CurveTween(curve: Curves.easeInOut);
          return SlideTransition(
            position: animation.drive(curveTween).drive(tween),
            child: MainScaffold(
              child: ValueListenableBuilder(
                valueListenable: SelectedPost(),
                builder: (contex, value, child) {
                  final selectedPostIndex = SelectedPost().value;

                  if (selectedPostIndex < 0) {
                    return const NotFoundPage();
                  }

                  final post = Posts().atIndex(selectedPostIndex);
                  return MarkdownBody(data: post.content);
                },
              ),
            ),
          );
        });
  }
}
