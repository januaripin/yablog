class AppRouteConfiguration {
  final String? slug;
  final bool isNotFound;

  AppRouteConfiguration.home()
      : slug = null,
        isNotFound = false;

  AppRouteConfiguration.post(this.slug) : isNotFound = false;

  AppRouteConfiguration.notFound()
      : slug = null,
        isNotFound = true;
}
