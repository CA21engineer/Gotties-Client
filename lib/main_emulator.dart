import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final domain = (!kIsWeb && Platform.isAndroid) ? '10.0.2.2' : 'localhost';
  await Firestore.instance.settings(
    persistenceEnabled: false,
    host: '$domain:8080',
    sslEnabled: false,
  );
  runApp(MyApp());
}
