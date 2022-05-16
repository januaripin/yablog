import 'meta.dart';

class Post {
  // id == slug
  final String id;
  final Meta meta;
  final String content;

  Post({required this.id, required this.meta, required this.content});
}
