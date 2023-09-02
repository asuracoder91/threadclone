import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/main/view/list_page.dart';

import 'main/view/search_page.dart';

final routerProvider = Provider((ref) {
  return GoRouter(initialLocation: "/", routes: [
    GoRoute(
      name: ListPage.routeName,
      path: ListPage.routeURL,
      builder: (context, state) => const ListPage(),
    ),
    GoRoute(
      name: SearchPage.routeName,
      path: SearchPage.routeURL,
      builder: (context, state) => const SearchPage(),
    ),
  ]);
});
