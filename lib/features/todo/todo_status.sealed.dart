import 'package:flutter_template/features/todo/models/todo.dart';

/// We return `sealed` class to handle different `states`
/// This lets us [exhaustively check] for every type using the `switch` pattern

sealed class TodoStatus {}

class TodoSuccess implements TodoStatus {
  final Todo todo;
  TodoSuccess(this.todo);
}

class TodoError implements TodoStatus {
  final String message;
  TodoError(this.message);
}

class TodoDeleted implements TodoStatus {
  final String message;
  TodoDeleted(this.message);
}
