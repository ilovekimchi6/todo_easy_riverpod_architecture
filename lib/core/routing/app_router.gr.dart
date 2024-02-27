// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddTodoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddTodoScreen(),
      );
    },
    TodoHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TodoHomeScreen(),
      );
    },
  };
}

/// generated route for
/// [AddTodoScreen]
class AddTodoRoute extends PageRouteInfo<void> {
  const AddTodoRoute({List<PageRouteInfo>? children})
      : super(
          AddTodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTodoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TodoHomeScreen]
class TodoHomeRoute extends PageRouteInfo<void> {
  const TodoHomeRoute({List<PageRouteInfo>? children})
      : super(
          TodoHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
