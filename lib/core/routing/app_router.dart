import 'package:auto_route/auto_route.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/presentation/screens/add_todo_screen.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/presentation/screens/todo_home_screen.dart';

part 'app_router.gr.dart';


//All your routing logic in one place
//You can add guards here too!

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.custom(durationInMilliseconds: 0);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TodoHomeRoute.page, initial: true),
        AutoRoute(page: AddTodoRoute.page),
      ];
}



