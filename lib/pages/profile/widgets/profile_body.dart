import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/models.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:provider/provider.dart';

class ProfileBody extends StatelessWidget {
  final PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );
  @override
  Widget build(BuildContext context) {
    final List<Article> articles = Provider.of<ArticleStore>(context).articles;

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
                '投稿',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            child: PageView(
              controller: controller,
              children: articles
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
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Likes',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          articles[index].beforeImageURL,
                          height: 200,
                        ),
                        Text(articles[index].title),
                      ],
                    ),
                  ),
                );
              },
              itemCount: articles.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
