import 'package:gottiesclient/models/entities/entities.dart';

@immutable
class Category {
  const Category({
    @required this.id,
    @required this.title,
    @required this.reading,
  });

  Category.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          reading: json['reading'] as String,
        );

  final String id;
  final String title;
  final String reading;
}
