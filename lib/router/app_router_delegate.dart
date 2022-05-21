import 'package:flutter/material.dart';

import '../presentation/home/home_page.dart';
import '../presentation/main/main_scaffold.dart';
import '../presentation/not_found/not_found_page.dart';
import '../presentation/post/post_page.dart';
import 'app_route_configuration.dart';
import 'app_router_state.dart';

class AppRouterDelegate extends RouterDelegate<AppRouteConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<AppRouteConfiguration> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppRouterState _appRouterState;

  AppRouterDelegate(AppRouterState appRouterState)
      : _appRouterState = appRouterState,
        navigatorKey = GlobalKey() {
    _appRouterState.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      transitionDelegate: NoAnimationTransitionDelegate(),
      pages: [
        MaterialPage(
          key: const ValueKey('HomePage'),
          child: MainScaffold(
            child: HomePage(
              onTapped: (String value) => _appRouterState.goToPostPage(value),
            ),
          ),
        ),
        if (_appRouterState.isPost)
          PostPage(
              key: ValueKey(_appRouterState.slug), slug: _appRouterState.slug!),
        if (_appRouterState.isNotFound)
          const MaterialPage(
            key: ValueKey('NotFoundPage'),
            child: MainScaffold(child: NotFoundPage()),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _appRouterState.goToHome();

        return true;
      },
    );
  }

  @override
  Future<bool> popRoute() {
    return super.popRoute();
  }

  @override
  Future<void> setNewRoutePath(AppRouteConfiguration configuration) async {
    if (configuration.isNotFound) {
      _appRouterState.goToNotFoundPage();
      return;
    } else if (configuration.slug != null) {
      _appRouterState.goToPostPage(configuration.slug);
    } else {
      _appRouterState.goToHome();
    }
  }

  @override
  AppRouteConfiguration get currentConfiguration {
    if (_appRouterState.isNotFound) {
      return AppRouteConfiguration.notFound();
    }
    return _appRouterState.isPost
        ? AppRouteConfiguration.post(_appRouterState.slug)
        : AppRouteConfiguration.home();
  }
}

class NoAnimationTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve(
      {required List<RouteTransitionRecord> newPageRouteHistory,
      required Map<RouteTransitionRecord?, RouteTransitionRecord>
          locationToExitingPageRoute,
      required Map<RouteTransitionRecord?, List<RouteTransitionRecord>>
          pageRouteToPagelessRoutes}) {
    final results = <RouteTransitionRecord>[];

    for (final pageRoute in newPageRouteHistory) {
      if (pageRoute.isWaitingForEnteringDecision) {
        pageRoute.markForAdd();
      }
      results.add(pageRoute);
    }

    for (final exitingPageRoute in locationToExitingPageRoute.values) {
      if (exitingPageRoute.isWaitingForExitingDecision) {
        exitingPageRoute.markForRemove();
        final pagelessRoutes = pageRouteToPagelessRoutes[exitingPageRoute];
        if (pagelessRoutes != null) {
          for (final pagelessRoute in pagelessRoutes) {
            pagelessRoute.markForRemove();
          }
        }
      }

      results.add(exitingPageRoute);
    }
    return results;
  }
}
