import '../entities/news.dart';

abstract class NewsRepository {
  Future<List<News>> getNews(String query, String fromDate);
}
