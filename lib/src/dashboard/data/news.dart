import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  const factory News({
    String? title,
    String? author,
    String? urlToImage,
    String? description,
    String? content,
  }) = _News;

  factory News.defaultValues() => News(
      urlToImage:
          'https://www.outsystems.com/Forge_CW/_image.aspx/Q8LvY--6WakOw9afDCuuGfdpOypWf7wwQViUz4gj-GY=/newsapi-2023-01-04%2000-00-00-2023-08-11%2005-48-06');

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
