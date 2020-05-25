import 'package:flutter/material.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:gottiesclient/util/typedefs.dart';
import 'package:gottiesclient/widgets/search_text_field.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({this.title, this.showSearch = false, this.onTapSearchBar});

  @required
  final String title;
  final bool showSearch;
  final VoidFunction onTapSearchBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: !showSearch && onTapSearchBar == null
          ? Text(title)
          : SearchTextField(
              onTapSearchBar: onTapSearchBar,
            ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
          child: FlatButton(
            child: ClipOval(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: Provider.of<LoginStore>(context).user?.photoUrl ?? '',
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/images/account_circle/normal.png'),
              ),
            ),
            shape: const CircleBorder(
              side: BorderSide(
                color: Colors.black,
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            onPressed: () {
              if (Provider.of<LoginStore>(context, listen: false).isLoggedIn) {
                Navigator.pushNamed(context, '/profile');
              } else {
                Navigator.pushNamed(context, '/login');
              }
            },
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
