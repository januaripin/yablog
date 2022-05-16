import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

import '../domain/entity/meta.dart';
import '../domain/entity/post.dart';
import '../presentation/home/posts.dart';

class ContentUtil {
  static const separator = '---';

  static Future<List<String>> getContentPaths() async {
    final assetManifest = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(assetManifest);

    return manifestMap.keys.where((String key) => key.contains('.md')).toList();
  }

  static Future<String> getContent(String path) async =>
      await rootBundle.loadString(path);

  static Future<List<Post>> getPosts() async {
    final paths = await getContentPaths();

    final posts = Posts();

    for (final path in paths) {
      final postString = await rootBundle.loadString(path);

      if (!postString.startsWith(separator)) {
        continue;
      }

      final metaLastIndex = postString.lastIndexOf(separator);

      final meta = Meta.fromYaml(
        loadYaml(postString.substring(0, metaLastIndex)),
      );

      final content = postString.substring(
          metaLastIndex + separator.length, postString.length);

      final post = Post(
        meta: meta,
        content: content,
      );

      posts.add(post);
    }

    return posts.values;
  }
}
