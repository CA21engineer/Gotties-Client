import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/article.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:gottiesclient/pages/detail/widgets/content_container.dart';
import 'package:gottiesclient/pages/detail/widgets/image_container.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailStore>(
      create: (context) => DetailStore(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ImageContainer(
              beforeImageURL: article.beforeImageURL,
              afterImageURL: article.afterImageURL,
            ),
            ContentContainer(
              article: article,
            ),
          ],
        ),
      ),
    );
  }
}
