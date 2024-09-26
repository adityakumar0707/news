import '../repositories/news_repository.dart';
import '../entities/news.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<List<News>> call(String query, String fromDate) {
    return repository.getNews(query, fromDate);
  }
}
