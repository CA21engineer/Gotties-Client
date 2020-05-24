import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginStore _loginStore = Provider.of<LoginStore>(context, listen: false);

    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const CloseButton(
                  color: Color(0xfffefefe),
                ),
              ),
              const Text(
                'Profile page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffefefe),
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                color: const Color(0xfffefefe),
                onPressed: () async {
                  await showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.share),
                          title: const Text('共有'),
                          onTap: () {
                            // TODO プロフィールを共有
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: const Text('ログアウト'),
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('確認'),
                                content: const Text('ログアウトします。よろしいですか？'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: const Text('キャンセル'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  FlatButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      _loginStore.logout();
                                      Navigator.popUntil(context, (route) => route.isFirst);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.95),
          ),
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Provider.of<LoginStore>(context).user?.displayName ?? '',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    '投稿数: ${Provider.of<ArticleStore>(context).postArticles.length}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    'お気に入り数: ${Provider.of<ArticleStore>(context).likeArticles.length}',
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
