import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  CategoryChip({@required String title})
      : assert(title.isNotEmpty),
        _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
        child: Text(_title),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red),
        ),
      );
}
