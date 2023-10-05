// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticleModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      source: SourceModel.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] ,
      author: json['author'] ,
      description: json['description'] ,
      url: json['url'] ,
      urlToImage: json['urlToImage'] ,
      publishedAt: json['publishedAt'] ,
      content: json['content'],
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
