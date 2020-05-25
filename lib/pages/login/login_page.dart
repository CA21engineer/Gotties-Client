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
          child: FlatButton(
            child: const Image(
              image: AssetImage('assets/images/btn_signin_google/normal.png'),
            ),
            onPressed: () {
              Provider.of<LoginStore>(context, listen: false).login();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            padding: const EdgeInsets.all(0),
          ),
        ));
  }
}
