import 'package:flutter/material.dart';
import 'package:gottiesclient/models/stores/stores.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlatButton(
                child: Image(
                  image: AssetImage(Provider.of<LoginStore>(context).isLoggedIn
                      ? 'assets/images/btn_signin_google/disabled.png'
                      : 'assets/images/btn_signin_google/normal.png'),
                ),
                onPressed: () {
                  Provider.of<LoginStore>(context, listen: false).login();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                padding: const EdgeInsets.all(0),
              ),
              Opacity(
                child: FlatButton(
                  child: const Text('Sign out'),
                  onPressed: () {
                    Provider.of<LoginStore>(context).logout();
                  },
                ),
                opacity: Provider.of<LoginStore>(context).isLoggedIn ? 1 : 0,
              ),
            ],
          ),
        ));
  }
}
