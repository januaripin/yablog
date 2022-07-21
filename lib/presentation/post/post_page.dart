import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../router/app_router_state.dart';
import '../../utils/gap.dart';
import '../app/app_content.dart';
import '../app/app_themes.dart';
import '../main/main_scaffold.dart';
import '../not_found/not_found_page.dart';
import 'nav_button.dart';

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
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            post.meta.title,
                            style: AppThemes.textTheme.displayLarge?.copyWith(
                              fontSize: 110,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gap.p8(scale: 10),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            width: kIsWeb ? 1300 : double.infinity,
                            child: Column(
                              children: [
                                MarkdownBody(data: post.content),
                                Gap.p8(scale: 10),
                                const Divider(),
                                SizedBox(
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      NavButton(
                                        hasDestination: prevPost != null,
                                        type: NavButtonType.previous,
                                        label: prevPost?.meta.title ?? '',
                                        onTapped: () => AppRouterState()
                                            .goToPostPage(prevPost?.id),
                                      ),
                                      NavButton(
                                        hasDestination: nextPost != null,
                                        type: NavButtonType.next,
                                        label: nextPost?.meta.title ?? '',
                                        onTapped: () => AppRouterState()
                                            .goToPostPage(nextPost?.id),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : const NotFoundPage(),
            ),
          );
        });
  }
}
