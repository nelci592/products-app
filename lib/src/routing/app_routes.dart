import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

enum ApplicationRoute {
  products("/products-list");

  final String path;

  const ApplicationRoute(this.path);
}

extension ApplicationRouteExtension on ApplicationRoute {
  void push(BuildContext context) => context.pushNamed(name);
}
