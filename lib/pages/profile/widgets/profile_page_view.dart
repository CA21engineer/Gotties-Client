import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/entities.dart';
import 'package:gottiesclient/pages/profile/widgets/category_chip.dart';
import 'package:gottiesclient/pages/profile/widgets/image_with_background.dart';
import 'package:gottiesclient/pages/profile/widgets/like_widget.dart';

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
                      child: ImageWithBackground(
                        imageURL: e.beforeImageURL,
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
                                CategoryChip(title: e.category.title),
                                LikeWidget(article: e),
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
