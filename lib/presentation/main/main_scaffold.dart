import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../router/app_router_state.dart';
import '../../utils/app_util.dart';
import '../app/app_themes.dart';

class MainScaffold extends StatelessWidget {
  final Widget? child;

  const MainScaffold({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => AppRouterState().goToHome(),
          child: Text(
            AppUtil.title,
            style: AppThemes.textTheme.titleLarge,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: kIsWeb ? 1100 : double.infinity,
          child: child,
        ),
      ),
    );
  }
}
