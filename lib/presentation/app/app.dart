import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../router/app_back_dispatcher.dart';
import '../../router/app_route_information_parser.dart';
import '../../router/app_router_delegate.dart';
import '../../router/app_router_state.dart';
import '../../utils/app_util.dart';
import 'app_themes.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppRouterDelegate _routerDelegate = AppRouterDelegate(AppRouterState());
  final AppRouteInformationParser _routeInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppUtil.title,
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      backButtonDispatcher: AppBackDispatcher(_routerDelegate),
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id', 'ID')],
      locale: const Locale('id', 'ID'),
    );
  }
}
