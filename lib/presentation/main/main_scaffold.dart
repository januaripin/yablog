import 'package:flutter/material.dart';

import '../../utils/navigator_util.dart';

class MainScaffold extends StatelessWidget {
  final Widget? body;

  const MainScaffold({Key? key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: GestureDetector(
          onTap: () => NavigatorUtil().goToHome(),
          child: Text(
            'blog',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: body,
    );
  }
}
