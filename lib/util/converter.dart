import 'package:cloud_firestore/cloud_firestore.dart';

String timeStampToJPDate(Timestamp timestamp) {
  final _year = timestamp.toDate().year;
  final _month = timestamp.toDate().month;
  final _day = timestamp.toDate().day;
  return '$_year年$_month月$_day日';
}
