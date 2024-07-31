import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/src/modules/products/presentation/pages/%20list%20page/products_list_page.dart';
import 'package:products_app/src/routing/app_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: ApplicationRoute.products.path,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: ApplicationRoute.products.path,
        name: ApplicationRoute.products.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ProductsListPage(),
        ),
      ),
    ],
  );
});
