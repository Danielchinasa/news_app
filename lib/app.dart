import 'package:conerpis_news/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _observer = NavigatorObserver();

  BuildContext get appContext => _observer.navigator!.context;
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider(_observer));

    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
    );
  }
}
