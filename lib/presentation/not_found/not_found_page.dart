import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  static MaterialPageRoute pageRoute() => MaterialPageRoute(
        builder: (_) => const NotFoundPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman tidak ditemukan'),
    );
  }
}
