import 'package:flutter/material.dart';
import 'package:gottiesclient/models/models.dart';
import 'package:gottiesclient/models/stores/post_page_store.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:gottiesclient/pages/detail/detail_page.dart';
import 'package:gottiesclient/pages/home/home_page.dart';
import 'package:gottiesclient/pages/post/post_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginStore(),
        ),
        Provider<BaseRepository>.value(
          value: FirestoreRepository(),
        ),
      ],
      child: Consumer2<LoginStore, BaseRepository>(
        builder: (_, loginStore, repository, ___) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ArticleStore(loginStore, repository),
              ),
              ChangeNotifierProvider(
                create: (_) => CategoryStore(repository),
              ),
              ChangeNotifierProvider(
                create: (_) => PostPageStore(),
              ),
              Provider(
                create: (_) => FocusNodeStore(),
                dispose: (_, FocusNodeStore store) {
                  store.focusNode.dispose();
                },
              ),
              Provider<ShareStore>.value(
                value: ShareStore(),
              ),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.red,
                fontFamily: 'NotoSansJP-Regular',
              ),
              routes: <String, WidgetBuilder>{
                '/': (BuildContext context) => HomePage(),
                '/detail': (BuildContext context) => const DetailPage(),
                '/post': (BuildContext context) => PostPage()
              },
            ),
          );
        },
      ),
    );
  }
}
