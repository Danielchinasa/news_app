import 'package:conerpis_news/src/dashboard/data/news_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsProvider = FutureProvider((ref) async {
  return ref.watch(newsApiServiceProvider).fetchNews();
});
