import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Core/Models/ArticleModel.dart';

import '../Apis/ApiService.dart';

class ArticlesProvider extends ChangeNotifier {
  late Future<List<ArticleModel>> articles;
  late Future<List<ArticleModel>> headLines;
  late List<String> categories;
  late List<ArticlesProvider> providers;

  ArticlesProvider({String? category}) {
    if (category != null) {
      headLines = getHeadLines(category: category);
    } else {
      categories = [
        'All News',
        'business',
        'entertainment',
        'general',
        'health',
        'science',
        'sports',
        'technology'
      ];
      providers = List.generate(categories.length,
          (index) => ArticlesProvider(category: categories[index]));
      articles = getArticle();
    }
  }

  Future<List<ArticleModel>> getArticle() async {
    final service =
        ApiService(Dio(BaseOptions(contentType: 'application/json')));
    return service.getArticles(
        {'q':'tech','apiKey': '55a4cdc31075492b81cdbb19b8539a8c', 'pageSize': 20});
  }

  Future<List<ArticleModel>> getHeadLines({required String category}) async {
    final service =
        ApiService(Dio(BaseOptions(contentType: 'application/json')));
    return service.getHeadlines({
      'apiKey': '55a4cdc31075492b81cdbb19b8539a8c',
      'pageSize': 20,
      'country':'in',
      'category': category
    });
  }
}
