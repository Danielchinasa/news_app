import 'dart:convert';

import 'package:conerpis_news/src/api_helper.dart';
import 'package:conerpis_news/src/dashboard/data/news.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['articles'];

      return data.map((e) => News.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

final newsApiServiceProvider = Provider<NewsRepository>((ref) {
  return NewsRepository();
});
