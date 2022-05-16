import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../main/main_scaffold.dart';
import '../not_found/not_found_page.dart';
import '../post/post_page.dart';
import 'app_route_path.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  String? slug;
  bool isNotFound = false;

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
              onTapped: (String value) {
                slug = value;
                notifyListeners();
              },
            ),
          ),
        ),
        if (slug != null) PostPage(slug!),
        if (isNotFound)
          const MaterialPage(
            key: ValueKey('NotFoundPage'),
            child: MainScaffold(child: NotFoundPage()),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        slug = null;
        isNotFound = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration.isNotFound) {
      slug = null;
      isNotFound = false;
      return;
    }

    if (configuration.isPost) {
      slug = configuration.slug;
      return;
    } else {
      slug = null;
    }

    isNotFound = false;
  }

  @override
  AppRoutePath get currentConfiguration {
    if (isNotFound) {
      return AppRoutePath.notFound();
    }
    return slug == null ? AppRoutePath.home() : AppRoutePath.post(slug);
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
