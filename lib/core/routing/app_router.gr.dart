// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:todo_easy_riverpod_architecture/features/todo/presentation/screens/add_todo_screen.dart'
    as _i1;
import 'package:todo_easy_riverpod_architecture/features/todo/presentation/screens/todo_home_screen.dart'
    as _i2;

/// generated route for
/// [_i1.AddTodoScreen]
class AddTodoRoute extends _i3.PageRouteInfo<void> {
  const AddTodoRoute({List<_i3.PageRouteInfo>? children})
      : super(
          AddTodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTodoRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddTodoScreen();
    },
  );
}

/// generated route for
/// [_i2.TodoHomeScreen]
class TodoHomeRoute extends _i3.PageRouteInfo<void> {
  const TodoHomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          TodoHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoHomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.TodoHomeScreen();
    },
  );
}
