import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/entities.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:provider/provider.dart';

class ProfilePageView extends StatelessWidget {
  ProfilePageView({@required List<Article> articles}) : _articles = articles;

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
          .map(
            (e) => GestureDetector(
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                            color: const Color(0xffeeeeee),
                          ),
                          Image.network(
                            e.beforeImageURL,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                                  child: Text(e.category.title),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.red),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Provider.of<ArticleStore>(context).isLike(e.id)
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.redAccent,
                                        ),
                                        onPressed: () {
                                          if (Provider.of<ArticleStore>(context, listen: false).isLike(e.id)) {
                                            Provider.of<ArticleStore>(context, listen: false).unlikeArticle(e.id);
                                          } else {
                                            Provider.of<ArticleStore>(context, listen: false).likeArticle(e.id);
                                          }
                                        },
                                      ),
                                      Text('${e.likeUserIds.length}'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              e.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: e,
                );
              },
            ),
          )
          .toList(),
    );
  }
}
