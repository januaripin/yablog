import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

import 'meta.dart';
import 'post.dart';
import 'posts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yanuar',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'blog',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: kIsWeb ? 960 : double.infinity,
            child: FutureBuilder<List<Post>>(
              builder: (context, future) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: future.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final post = future.data![index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(post.meta.title),
                            const Spacer(),
                            Text(post.meta.date.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              future: getPosts(),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<String>> getContentPaths() async {
    final assetManifest = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(assetManifest);

    return manifestMap.keys.where((String key) => key.contains('.md')).toList();
  }

  Future<String> getContent(String path) async =>
      await rootBundle.loadString(path);

  Future<List<Post>> getPosts() async {
    final paths = await getContentPaths();

    final posts = Posts();

    for (final path in paths) {
      final postString = await rootBundle.loadString(path);

      if (!postString.startsWith('---')) {
        continue;
      }

      final metaLastIndex = postString.lastIndexOf('---');

      try {
        final meta = Meta.fromYaml(
          loadYaml(postString.substring(0, metaLastIndex)),
        );

        final content = postString.substring(metaLastIndex, postString.length);

        final post = Post(
          meta: meta,
          content: content,
        );

        posts.add(post);
      } catch (e) {
        log(e.toString());
      }
    }

    return posts.values;
  }
}
