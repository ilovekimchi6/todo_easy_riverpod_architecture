import 'package:flutter_template/features/todo/models/todo.dart';
import 'package:flutter_template/features/todo/todo_status.sealed.dart';
import 'package:sembast/sembast.dart';

/// Abstract class defining methods for interacting with todo data,
/// for both [remote] and [local] database repositories
abstract class TodoRepository {
  /// `Adds` a new todo item.
  Future<TodoStatus> addTodo(Todo todo);

  /// `Removes` a todo item by its `ID`.
  Future<TodoStatus> removeTodoById(String id);

  /// `Updates` a todo item by its `ID`.
  Future<TodoStatus> updateTodoById(String id, Todo todo);

  /// `Builds` a `stream` of todo items.
  Stream<List<Todo>> build(Database database);
}
