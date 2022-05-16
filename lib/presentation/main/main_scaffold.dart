import 'package:flutter/material.dart';

import '../post/selected_post.dart';

class MainScaffold extends StatelessWidget {
  final Widget? child;

  const MainScaffold({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: GestureDetector(
          onTap: () => SelectedPost().unselect(),
          child: Text(
            'blog',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: child,
    );
  }
}
