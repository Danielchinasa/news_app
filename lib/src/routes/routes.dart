import 'package:conerpis_news/src/dashboard/news_details_screen.dart';
import 'package:conerpis_news/src/dashboard/news_screen.dart';
import 'package:conerpis_news/src/onboarding/onboarding_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RouteLoggerObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is MaterialPageRoute) {
      print('Navigated to: ${route.settings.name}');
    }
  }
}

// GoRouter configuration
//!! Adding the NavigatorObserver to log my route movement
final routerProvider = Provider.family<GoRouter, NavigatorObserver>(
  (ref, observer) {
    return GoRouter(
      initialLocation: '/',
      observers: [observer, RouteLoggerObserver()],
      routes: <RouteBase>[
        GoRoute(
          name: 'home', // ** Optional, add name to your routes. Allows you navigate by name instead of path
          path: '/',
          builder: (context, state) => OnboardingScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => NewsScreen(),
        ),
        GoRoute(
            path: '/newsDetails/:getIndex',
            name: 'newsDetails',
            builder: (context, state) {
              return NewsDetailsScreen(
                getIndex: int.parse(state.pathParameters['getIndex'] ?? ''),
              );
            })
      ],
    );
  },
);
