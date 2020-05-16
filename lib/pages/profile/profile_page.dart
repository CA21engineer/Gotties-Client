import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/entities.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Article> articles = Provider.of<ArticleStore>(context).articles;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(50),
              child: Center(
                child: ClipOval(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: Provider.of<LoginStore>(context).user?.photoUrl ?? '',
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/images/account_circle/normal.png'),
                  ),
                ),
              ),
            ),
            Text(
              Provider.of<LoginStore>(context).user?.displayName ?? '',
              style: const TextStyle(fontSize: 20),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(8),
              child: const Text(
                '投稿した Before After',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          articles[index].beforeImageURL,
                          height: 200,
                        ),
                        Text(articles[index].title),
                      ],
                    ),
                  );
                },
                itemCount: articles.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(8),
              child: const Text(
                'いいねした Before After',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          articles[index].beforeImageURL,
                          height: 200,
                        ),
                        Text(articles[index].title),
                      ],
                    ),
                  );
                },
                itemCount: articles.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
