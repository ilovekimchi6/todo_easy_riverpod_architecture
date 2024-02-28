import 'package:todo_easy_riverpod_architecture/features/todo/todo_status.sealed.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/models/todo.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/repositories/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'remote_todo_repository.g.dart';

/// This class represents a [remote repository] for `managing` todo data.
/// NOTE: It has not been implemented yet.
@riverpod
class RemoteRepository extends _$RemoteRepository implements TodoRepository {
  @override
  Stream<List<Todo>> build(Database database) {
    return getSongsStream();
  }

  /// `Add` a new todo to the remote repository.
  @override
  Future<TodoStatus> addTodo(Todo todo) {
    // TODO: Implement addTodo
    throw UnimplementedError();
  }

  /// `Remove` a todo from the remote repository by its `ID`.
  @override
  Future<TodoStatus> removeTodoById(String id) {
    // TODO: Implement removeTodoById
    throw UnimplementedError();
  }

  /// `Update` a todo in the remote repository by its `ID`.
  @override
  Future<TodoStatus> updateTodoById(String id, Todo todo) {
    // TODO: Implement updateTodoById
    throw UnimplementedError();
  }
}

/// This function returns a `stream` of todo items.
Stream<List<Todo>> getSongsStream() async* {
  List<Todo> song = [];
  yield song;
}
