import 'package:flutter/material.dart';
import '../../domain/usecases/get_news_usecase.dart';
import '../../domain/entities/news.dart';

class NewsProvider with ChangeNotifier {
  final GetNewsUseCase getNewsUseCase;

  List<News> _newsArticles = [];
  bool _isLoading = false;
  String _errorMessage = '';

  NewsProvider(this.getNewsUseCase);

  List<News> get newsArticles => _newsArticles;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchNews(String query, String fromDate) async {
    _isLoading = true;
    notifyListeners();

    try {
      _newsArticles = await getNewsUseCase(query, fromDate);
      _errorMessage = '';
    } catch (error) {
      _errorMessage = 'Failed to load news';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
