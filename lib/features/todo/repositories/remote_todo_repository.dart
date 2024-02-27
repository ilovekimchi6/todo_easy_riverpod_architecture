import 'package:todo_easy_riverpod_architecture/features/todo/todo_status.sealed.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/models/todo.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/repositories/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'remote_todo_repository.g.dart';

//Please note this is not yet implemented
//Feel free to implement the code for your remore repository!

@riverpod
class RemoteRepository extends _$RemoteRepository implements TodoRepository {
  @override
  Stream<List<Todo>> build(Database database) {
    return getSongsStream();
  }

  Future<TodoStatus> addTodo(Todo todo) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  Future<TodoStatus> removeTodoById(String id) {
    // TODO: implement removeTodoById
    throw UnimplementedError();
  }

  Future<TodoStatus> updateTodoById(String id, Todo todo) {
    // TODO: implement updateTodoById
    throw UnimplementedError();
  }
}

Stream<List<Todo>> getSongsStream() async* {
  List<Todo> song = [];
  yield song;
}
