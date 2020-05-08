import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/entities.dart';
import 'package:gottiesclient/util/typedefs.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({this.category, this.onTapCategory});

  @required
  final Category category;
  @required
  final VoidCategoryFunction onTapCategory;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 8),
            child: _buildCategoryItem(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem() {
    return FlatButton(
      color: Colors.white,
      textColor: Colors.red[700],
      splashColor: Colors.red[200],
      focusColor: Colors.red[700],
      padding: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      onPressed: () => onTapCategory(category),
      child: Text(
        category.title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
