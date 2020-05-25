import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/models.dart';
import 'package:gottiesclient/pages/profile/widgets/profile_page_view.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    @required List<Article> postedArticles,
    @required List<Article> favoriteArticles,
  })  : _postedArticles = postedArticles,
        _favoriteArticles = favoriteArticles;

  final List<Article> _postedArticles;
  final List<Article> _favoriteArticles;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfffefefe),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(8),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                '投稿した Before After',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 300,
            child: ProfilePageView(
              articles: _postedArticles,
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(8),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'いいねした Before After',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 50),
            child: ProfilePageView(
              articles: _favoriteArticles,
            ),
          ),
        ],
      ),
    );
  }
}
