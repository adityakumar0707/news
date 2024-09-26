class NewsModel {
  final String title;
  final String description;
  final String url;
  final String publishedAt;
  final String imageUrl;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.publishedAt,
    required this.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      publishedAt: json['publishedAt'],
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}
