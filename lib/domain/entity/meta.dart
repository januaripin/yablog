import 'package:yaml/yaml.dart';

class Meta {
  final String title;
  final DateTime date;
  final bool draft;
  final String slug;
  final List<String> categories;
  final List<String> tags;
  final String languageCode;
  final String featureImage;

  Meta({
    required this.title,
    required this.date,
    required this.slug,
    required this.categories,
    required this.tags,
    required this.featureImage,
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
      featureImage: map['feature_image'] ?? '',
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
        'feature_image': featureImage,
      };

  @override
  String toString() => toJson().toString();
}
