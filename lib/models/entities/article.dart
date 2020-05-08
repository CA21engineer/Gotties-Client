import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gottiesclient/models/entities/entities.dart';

@immutable
class Article {
  const Article({
    @required this.id,
    @required this.userID,
    @required this.title,
    @required this.body,
    @required this.beforeImageURL,
    @required this.afterImageURL,
    @required this.category,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.likeUserIds,
  });

  Article.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          userID: json['user_id'] as String,
          title: json['title'] as String,
          body: json['body'] as String,
          beforeImageURL: json['before'] as String,
          afterImageURL: json['after'] as String,
          category: Category.fromJson(json['category'] as Map<String, dynamic>),
          createdAt: json['created_at'] as Timestamp,
          updatedAt: json['updated_at'] as Timestamp,
          likeUserIds: json['like_users'] as List<String>,
        );

  final String id;
  final String userID;
  final String title;
  final String body;
  final Category category;
  final String beforeImageURL;
  final String afterImageURL;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final List<String> likeUserIds;
}
