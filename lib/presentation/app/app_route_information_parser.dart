import 'package:flutter/material.dart';

import 'app_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    if (routeInformation.location == '/') {
      return AppRoutePath.home();
    }

    if (routeInformation.location == '/404') {
      return AppRoutePath.notFound();
    }

    var slug = uri.pathSegments[0];
    return AppRoutePath.post(slug);
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isNotFound) {
      return const RouteInformation(location: '/404');
    }
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/');
    }
    if (configuration.isPost) {
      return RouteInformation(location: '/${configuration.slug}');
    }
    return const RouteInformation(location: '/');
  }
}
