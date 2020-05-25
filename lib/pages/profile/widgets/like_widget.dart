import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/entities.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:provider/provider.dart';

class LikeWidget extends StatelessWidget {
  const LikeWidget({@required Article article})
      : assert(article != null),
        _article = article;

  final Article _article;

  @override
  Widget build(BuildContext context) {
    final articleStore = Provider.of<ArticleStore>(context, listen: false);
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Provider.of<ArticleStore>(context).isLike(_article.id) ? Icons.favorite : Icons.favorite_border,
            color: Colors.redAccent,
          ),
          onPressed: () {
            if (articleStore.isLike(_article.id)) {
              articleStore.unlikeArticle(_article.id);
            } else {
              articleStore.likeArticle(_article.id);
            }
          },
        ),
        Text('${_article.likeUserIds.length}'),
      ],
    );
  }
}
