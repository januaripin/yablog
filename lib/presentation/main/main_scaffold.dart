import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../const/assets_path.dart';
import '../../router/app_router_state.dart';
import '../../utils/app_util.dart';
import '../../utils/gap.dart';
import '../app/app_themes.dart';

class MainScaffold extends StatelessWidget {
  final Widget? child;

  const MainScaffold({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: GestureDetector(
          onTap: () => AppRouterState().goToHome(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsPath.abLogoTransparent, width: 32),
              Gap.p8(),
              Text(
                AppUtil.title,
                style: AppThemes.textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
      body: Center(child: child),
    );
  }
}
