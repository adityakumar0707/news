import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

import '../../../domain/entities/news.dart';
import '../../provider/news_provider.dart';
import '../../provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final newsProvider = Provider.of<NewsProvider>(context, listen: false);
      newsProvider.fetchNews('Apple', '2024-09-21');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final newsProvider = Provider.of<NewsProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeProvider.isDarkMode()
            ? AppColors.darkBackgroundColor
            : AppColors.lightBorderColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                color: themeProvider.isDarkMode()
                    ? AppColors.darkPrimaryColor
                    : AppColors.lightPrimaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'MyNews',
                      style: AppTextStyles.lightBold.copyWith(
                        color: themeProvider.isDarkMode() ? Colors.black : Colors.white,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: themeProvider.toggleTheme,
                      child: Icon(
                        Icons.touch_app,
                        color: themeProvider.isDarkMode() ? Colors.black : Colors.white,
                      ),
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      'IN',
                      style: AppTextStyles.lightBold.copyWith(
                        color: themeProvider.isDarkMode() ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Headlines',
                      style: AppTextStyles.lightBold.copyWith(
                        color: themeProvider.isDarkMode() ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    newsProvider.isLoading
                        ? Center(child: CircularProgressIndicator()) // Show loading indicator
                        : newsProvider.newsArticles.isEmpty
                        ? Center(child: Text('No news available'))
                        : ListView.builder(
                      itemCount: newsProvider.newsArticles.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), // Prevent scrolling issues
                      itemBuilder: (context, index) {
                        final News news = newsProvider.newsArticles[index]; // Changed to News
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: themeProvider.isDarkMode()
                                ? AppColors.darkPrimaryColor
                                : AppColors.lightBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      news.title ?? 'Unknown Title',
                                      style: AppTextStyles.lightBold.copyWith(
                                        color: themeProvider.isDarkMode()
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Text(
                                      news.description ?? 'No description available',
                                      style: AppTextStyles.lightMedium.copyWith(
                                          color: themeProvider.isDarkMode()
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.normal),
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Text(
                                      '${news.publishedAt ?? 'Unknown time'}',
                                      style: AppTextStyles.lightRegular.copyWith(
                                        color: themeProvider.isDarkMode()
                                            ? Colors.white
                                            : AppColors.lightBorderColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: width * 0.03),
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: height * 0.18,
                                    child: Image.network(
                                      news.imageUrl?.isNotEmpty == true
                                          ? news.imageUrl
                                          : "https://static.vecteezy.com/system/resources/previews/010/586/357/original/breaking-news-background-business-or-technology-template-breaking-news-text-on-dark-blue-with-earth-and-world-map-background-tv-news-show-broadcast-design-vector.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
