class AppRoutePath {
  final String? slug;
  final bool isNotFound;

  AppRoutePath.home()
      : slug = null,
        isNotFound = false;

  AppRoutePath.post(this.slug) : isNotFound = false;

  AppRoutePath.notFound()
      : slug = null,
        isNotFound = true;

  bool get isHomePage => slug == null;

  bool get isPost => slug != null;
}
