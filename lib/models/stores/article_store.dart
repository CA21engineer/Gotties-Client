import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gottiesclient/models/entities/article.dart';
import 'package:gottiesclient/models/models.dart';
import 'package:gottiesclient/models/stores/stores.dart';

class ArticleStore extends ChangeNotifier {
  ArticleStore(LoginStore loginStore, BaseRepository repository)
      : assert(repository != null),
        assert(loginStore != null),
        _loginStore = loginStore,
        _repository = repository {
    getArticles();
  }

  final BaseRepository _repository;
  final LoginStore _loginStore;
  List<Article> _allArticles;
  List<Article> articles;

  String get userID => _loginStore.user?.uid;

  Future<void> getArticles() async {
    try {
      _allArticles = await _repository.getArticles();
      articles = _allArticles;
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> postArticle(String title, File before, File after, String body, String categoryId) async {
    try {
      if (!_loginStore.isLoggedIn) {
        await _loginStore.loginAnonymously();
      }
      await _repository.postArticle(title, before, after, body, categoryId, userID ?? '');
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteArticle(Article article) async {
    try {
      if (userID == article.userID) {
        throw UnauthorisedException();
      }
      await _repository.deleteArticle(article.id, userID);
      _allArticles = _allArticles.where((element) => element.id != article.id).toList();
      articles = articles.where((element) => element.id != article.id).toList();
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> likeArticle(String articleID) async {
    try {
      if (userID == null) {
        throw UnauthorisedException();
      }
      await _repository.likeArticle(userID, articleID);
      _allArticles.forEach(
        (article) {
          if (article.id == articleID) {
            article.likeUserIds.add(_loginStore.user.uid);
          }
        },
      );
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  bool isLike(String articleId) {
    if (userID == null) {
      return false;
    }
    final article = _allArticles.firstWhere((article) => article.id == articleId);
    final isLike = article.likeUserIds.contains(userID);
    return isLike;
  }

  Future<void> unlikeArticle(String articleID) async {
    try {
      if (userID == null) {
        throw UnauthorisedException();
      }
      await _repository.unlikeArticle(userID, articleID);
      _allArticles.forEach((article) {
        if (article.id == articleID) {
          article.likeUserIds.remove(userID);
        }
      });
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  void filterArticles(Category category) {
    // TODO: APIが完成したらAPIを叩く
    articles = _allArticles
        .where(
          (article) => article.category.id == category.id,
        )
        .toList();
    notifyListeners();
  }

  bool isMyArticle(Article article) {
    return article.userID == userID;
  }
}
