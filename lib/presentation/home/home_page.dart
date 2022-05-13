import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/post.dart';
import '../../utils/content_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute(
        settings: settings,
        builder: (_) => const HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  return GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed('/${post.meta.slug}'),
                    child: Card(
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
                    ),
                  );
                },
              );
            },
            future: ContentUtil.getPosts(),
          ),
        ),
      ),
    );
  }
}
