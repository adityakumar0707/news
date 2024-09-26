import '../../domain/entities/news.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<News>> getNews(String query, String fromDate) async {
    final newsModels = await remoteDataSource.fetchNews(query, fromDate);
    return newsModels.map((model) => News(
      title: model.title,
      description: model.description,
      url: model.url,
      publishedAt: model.publishedAt,
      imageUrl: model.imageUrl,
    )).toList();
  }
}
