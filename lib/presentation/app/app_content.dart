import '../../domain/entity/post.dart';

class AppContent {
  AppContent._createInstance();

  static final AppContent _instance = AppContent._createInstance();

  factory AppContent() => _instance;

  final List<Post> posts = <Post>[];

  void add(Post post) {
    if (!posts.any((value) => value.meta.slug == post.meta.slug)) {
      posts.add(post);
    }
  }

  void remove(Post post) {
    posts.remove(post);
  }

  void removeAt(int index) {
    posts.removeAt(index);
  }

  Post atIndex(int atIndex) {
    return posts[atIndex];
  }

  Post? bySlug(String slug) {
    return posts.firstWhere((value) => value.id == slug);
  }
}
