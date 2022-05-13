import '../../domain/entity/post.dart';

class Posts {
  Posts._createInstance();

  static final Posts _instance = Posts._createInstance();

  factory Posts() => _instance;

  final List<Post> values = <Post>[];

  void add(Post post) {
    if (!values.any((value) => value.meta.slug == post.meta.slug)) {
      values.add(post);
    }
  }

  void remove(Post post) {
    values.remove(post);
  }

  void removeAt(int index) {
    values.removeAt(index);
  }

  Post atIndex(int atIndex) {
    return values[atIndex];
  }
}
