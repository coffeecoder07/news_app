import 'package:dio/dio.dart';
import 'package:news_app/Core/Models/ArticleModel.dart';
import 'package:retrofit/http.dart';

part 'ApiService.g.dart';



@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class ApiService{
  factory ApiService(Dio dio ) = _ApiService;

  @GET('everything')
  Future<List<ArticleModel>> getArticles(@Queries() Map<String, dynamic> queries);
  
  @GET('top-headlines')
  Future<List<ArticleModel>> getHeadlines(@Queries() Map<String,dynamic> queries);

}