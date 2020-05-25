import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/entities.dart';
import 'package:gottiesclient/models/models.dart';

class CategoryRepository extends ChangeNotifier {
  CategoryRepository(BaseClient client)
      : assert(client != null),
        _client = client {
    getCategories();
  }

  final BaseClient _client;
  List<Category> _categories;
  List<Category> searchedCategories;

  // カテゴリを選択していない状態(null) = 全てのカテゴリ
  Category selectedCategory;

  Future<void> getCategories() async {
    try {
      _categories = await _client.getCategories();
      searchedCategories = _categories;
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void searchCategory(String word) {
    searchedCategories = _categories
        .where(
          (category) => category.title.contains(word) || category.reading.contains(word),
        )
        .toList();
    notifyListeners();
  }

  void onSelectCategory(Category category) {
    selectedCategory = category;
    notifyListeners();
  }
}
