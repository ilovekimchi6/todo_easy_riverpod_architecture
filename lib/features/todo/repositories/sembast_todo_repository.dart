import 'dart:math';

import 'package:todo_easy_riverpod_architecture/features/todo/todo_status.sealed.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/models/todo.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/repositories/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'sembast_todo_repository.g.dart';



//The repository is a Notifier class with all the methods that we need to interact with the database. It implements TodoRepository abstract class.
//Please note the business logic and parsing data is done inside the notifier class, because abstracting away the state management from the repository makes for badder code.
//You can read more about this in the Riverpod Documentation!

//NOTE- Not one method is inherently better than the other, you can always create a repository class and make a provider that returns the repository class too.
//This abstracts away the state management from the repository, but it is not necessary to do so.


//I have chosen to use a notifier class because it is a good way to handle state management and business logic in one place.


//If you want to read about reepository pattern please read here!
//https://codewithandrea.com/articles/flutter-repository-pattern/

@riverpod
class SembastRepository extends _$SembastRepository implements TodoRepository {
  final StoreRef<int, Map<String, dynamic>> _store =
      intMapStoreFactory.store('todo');

  @override
  Stream<List<Todo>> build(Database database) {
    var query = _store.query();

    return query.onSnapshots(database).map((snapshots) {
      if (snapshots.isEmpty) {
        return [];
      } else {
        return snapshots.map(
          (todoSnapShot) {
            final todoMap = Map<String, dynamic>.from(todoSnapShot.value);
            todoMap['id'] = todoSnapShot.key.toString();
            return Todo.fromJson(todoMap);
          },
        ).toList();
      }
    });
  }


  @override
  Future<TodoStatus> addTodo(Todo todo) async {
    await _store.add(database, todo.toJson());

    return TodoSuccess(todo);
  }

  @override
  Future<TodoStatus> removeTodoById(String todoId) async {
    int? value = await _store.record(int.parse(todoId)).delete(database);

    if (value != null) {
      return TodoDeleted(e.toString());
    } else {
      return TodoError(e.toString());
    }
  }


  @override
  Future<TodoStatus> updateTodoById(String todoId, Todo todo) async {
    int intTodoId = int.parse(todo.id);

    final todoJson = todo.toJson();

    Map<String, dynamic>? value =
        await _store.record(intTodoId).update(database, todoJson);

    if (value != null) {
      return TodoSuccess(todo);
    } else {
      return TodoError(e.toString());
    }
  }
}

