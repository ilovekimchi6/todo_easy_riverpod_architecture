import 'package:auto_route/auto_route.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/presentation/screens/add_todo_screen.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/presentation/screens/todo_home_screen.dart';

part 'app_router.gr.dart';

/// Manages all [routing logic] for the application.
/// Allows defining `routes` and specifying `initial routes`.
/// [Guards] can also be added here to control access to routes.

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  /// Specifies the `default` [route type] for the application.
  /// Here, we use a `custom route` type with [no transition duration].
  @override
  RouteType get defaultRouteType =>
      const RouteType.custom(durationInMilliseconds: 0);

  /// Defines the `list of routes` for the application.
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TodoHomeRoute.page, initial: true),
        AutoRoute(page: AddTodoRoute.page),
      ];
}
