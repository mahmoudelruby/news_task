// lib/controllers/news_controller.dart
import 'package:flutter/foundation.dart';
import 'package:news_app/model/artical.dart';
import 'package:news_app/service/news_service.dart';


class NewsController with ChangeNotifier {
  final NewsService _newsService = NewsService();
  List<Article> _articles = [];
  bool _isLoading = false;
  String _error = '';
  String _selectedCategory = '';

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;
  String get error => _error;
  String get selectedCategory => _selectedCategory;

  Future<void> fetchTopHeadlines() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _articles = await _newsService.getTopHeadlines(category: _selectedCategory);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchArticles(String query) async {
    if (query.isEmpty) {
      await fetchTopHeadlines();
      return;
    }

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _articles = await _newsService.searchArticles(query);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setCategory(String category) {
    _selectedCategory = category;
    fetchTopHeadlines();
  }
}