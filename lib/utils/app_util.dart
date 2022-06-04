class AppUtil {
  static String get title =>
      const String.fromEnvironment('appName', defaultValue: 'blog');
}
