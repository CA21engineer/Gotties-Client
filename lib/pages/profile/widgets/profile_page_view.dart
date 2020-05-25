import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/entities.dart';

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
          .map((e) => Card(
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
                      padding: const EdgeInsets.all(4),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
                              padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                              child: Text(e.category.title),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red),
                              ),
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
              ))
          .toList(),
    );
  }
}
