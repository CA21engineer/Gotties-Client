import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/stores/article_store.dart';
import 'package:gottiesclient/pages/profile/widgets/profile_body.dart';
import 'package:gottiesclient/pages/profile/widgets/profile_header.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              const Color(0xffFF3A31).withOpacity(0.7),
              const Color(0xffFFeeee).withOpacity(0.7),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                ProfileHeader(),
                ProfileBody(
                  postedArticles: Provider.of<ArticleStore>(context).postArticles,
                  favoriteArticles: Provider.of<ArticleStore>(context).likeArticles,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
