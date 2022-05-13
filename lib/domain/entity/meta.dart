import 'package:yaml/yaml.dart';

class Meta {
  final String title;
  final DateTime date;
  final bool draft;
  final String slug;
  final List<String> categories;
  final List<String> tags;
  final String languageCode;

  Meta({
    required this.title,
    required this.date,
    required this.slug,
    required this.categories,
    required this.tags,
    this.draft = true,
    this.languageCode = 'id',
  });

  factory Meta.fromYaml(YamlMap map) {
    return Meta(
      title: map['title'],
      date: DateTime.parse(map['date']),
      slug: map['slug'],
      categories: (map['categories'] as YamlList)
          .nodes
          .map((e) => e.toString())
          .toList(), // parse YamlList to list<dynamic>
      tags: (map['tags'] as YamlList).nodes.map((e) => e.toString()).toList(),
      draft: map['draft'],
      languageCode: map['language_code'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'slug': slug,
        'categories': categories,
        'tags': tags,
        'draft': draft,
        'language_code': languageCode,
      };

  @override
  String toString() => toJson().toString();
}
