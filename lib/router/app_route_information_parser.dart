import 'package:flutter/material.dart';

import 'app_route_configuration.dart';

class AppRouteInformationParser
    extends RouteInformationParser<AppRouteConfiguration> {
  @override
  Future<AppRouteConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    if (routeInformation.location == '/') {
      return AppRouteConfiguration.home();
    }

    if (routeInformation.location == '/404') {
      return AppRouteConfiguration.notFound();
    }

    var slug = uri.pathSegments[0];
    return AppRouteConfiguration.post(slug);
  }

  @override
  RouteInformation? restoreRouteInformation(
      AppRouteConfiguration configuration) {
    if (configuration.isNotFound) {
      return const RouteInformation(location: '/404');
    }
    if (configuration.slug == null) {
      return const RouteInformation(location: '/');
    }
    if (configuration.slug != null) {
      return RouteInformation(location: '/${configuration.slug}');
    }
    return const RouteInformation(location: '/');
  }
}
