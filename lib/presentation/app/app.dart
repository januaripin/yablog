import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../main/main_scaffold.dart';
import '../post/post_page.dart';
import '../post/selected_post.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yanuar',
      home: ValueListenableBuilder(
        valueListenable: SelectedPost(),
        builder: (context, value, child) {
          return Navigator(
            pages: [
              const MaterialPage(
                key: ValueKey('HomePage'),
                child: MainScaffold(child: HomePage()),
              ),
              if (SelectedPost().value > -1) PostPage(),
            ],
            onPopPage: (route, result) {
              if (!route.didPop(result)) {
                return false;
              }

              SelectedPost().unselect();

              return true;
            },
          );
        },
      ),
    );
  }
}
