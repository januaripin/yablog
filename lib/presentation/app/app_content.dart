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

  Post? nextPost(String currentSlug) {
    final currentIndex = posts.indexWhere((post) => post.id == currentSlug);

    if (currentIndex == -1 || currentIndex == posts.length - 1) {
      return null;
    }

    return posts[currentIndex + 1];
  }

  Post? prevPost(String currentSlug) {
    final currentIndex = posts.indexWhere((post) => post.id == currentSlug);

    if (currentIndex <= 0) {
      return null;
    }

    return posts[currentIndex - 1];
  }
}
