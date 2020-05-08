import 'package:flutter/material.dart';

class PostPageStore extends ChangeNotifier {
  final TextEditingController categoryController = TextEditingController();

  String get categoryTitle => categoryController.text;
  set categoryTitle(String categoryTitle) => categoryController.text = categoryTitle;

  @override
  void dispose() {
    categoryController.dispose();
    super.dispose();
  }
}
