import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/entities.dart';
import 'package:gottiesclient/models/models.dart';

class CategoryStore extends ChangeNotifier {
  CategoryStore(BaseRepository repository)
      : assert(repository != null),
        _repository = repository {
    getCategories();
  }

  final BaseRepository _repository;
  List<Category> _categories;
  List<Category> searchedCategories;

  // カテゴリを選択していない状態(null) = 全てのカテゴリ
  Category selectedCategory;

  Future<void> getCategories() async {
    try {
      _categories = await _repository.getCategories();
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
