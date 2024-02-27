import 'package:todo_easy_riverpod_architecture/features/todo/todo_status.sealed.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/models/todo.dart';
import 'package:sembast/sembast.dart';


//The abstract class that both our remote and local database repositories will implement

abstract class TodoRepository {
  Future<TodoStatus> addTodo(Todo todo);
  Future<TodoStatus> removeTodoById(String id);
  Future<TodoStatus> updateTodoById(String id, Todo todo);
  Stream<List<Todo>> build(Database database);
}