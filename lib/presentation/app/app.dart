import 'package:flutter/material.dart';

import '../../utils/navigator_util.dart';
import '../home/home_page.dart';
import '../main/main_scaffold.dart';
import '../post/post_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yanuar',
      builder: (context, child) {
        return MainScaffold(
          body: child,
        );
      },
      navigatorKey: NavigatorUtil().navigatorKey,
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return HomePage.pageRoute(settings);
        }

        return PostPage.pageRoute(settings);
      },
    );
  }
}
