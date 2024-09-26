import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSource(this.client);

  Future<List<NewsModel>> fetchNews(String query, String fromDate) async {
    final url =
        'https://newsapi.org/v2/everything?q=$query&from=$fromDate&sortBy=popularity&apiKey=ec3a741a2ab84d969d95f07133bf6e27';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> articles = jsonData['articles'];
      print(articles.toString());
      return articles.map((article) => NewsModel.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
