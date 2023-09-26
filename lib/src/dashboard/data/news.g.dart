// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_News _$$_NewsFromJson(Map<String, dynamic> json) => _$_News(
      title: json['title'] as String?,
      author: json['author'] as String?,
      urlToImage: json['urlToImage'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_NewsToJson(_$_News instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'urlToImage': instance.urlToImage,
      'description': instance.description,
      'content': instance.content,
    };
