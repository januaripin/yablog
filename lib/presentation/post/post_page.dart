import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  static MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute(
        settings: settings,
        builder: (_) => const PostPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('Post Page'),
      ),
    );
  }
}
