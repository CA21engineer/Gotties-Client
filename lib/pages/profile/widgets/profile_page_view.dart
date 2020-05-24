import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/entities.dart';

class ProfilePageView extends StatelessWidget {
  ProfilePageView({@required List<Article> articles})
      : _articles = articles,
        assert(articles.isNotEmpty);

  final PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.85,
  );
  final List<Article> _articles;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: _articles
          .map((e) => Card(
                child: Column(
                  children: <Widget>[
                    Image.network(
                      e.beforeImageURL,
                      height: 200,
                    ),
                    Text(e.title),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
