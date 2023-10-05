import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/Core/Models/SourceModel.dart';

part 'ArticleModel.g.dart';

@JsonSerializable()
class ArticleModel{
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleModel({
    required this.source,
    required this.title,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
});

  factory ArticleModel.fromJson(Map<String,dynamic> map) => _$ArticleModelFromJson(map);
  Map<String,dynamic> toJson() => _$ArticleModelToJson(this);
}


