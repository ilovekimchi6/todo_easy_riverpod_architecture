import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/core/routing/app_router.gr.dart';

/// Manages all [routing logic] for the application.
/// Allows defining `routes` and specifying `initial routes`.
/// [Guards] can also be added here to control access to routes.
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: TodoHomeRoute.page, initial: true),
    AutoRoute(page: AddTodoRoute.page),
  ];
}
