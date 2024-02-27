import 'package:auto_route/auto_route.dart';
import 'package:todo_easy_riverpod_architecture/core/common_providers/sembast_db.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/models/todo.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/repositories/sembast_todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class AddTodoScreen extends HookConsumerWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController titleController = TextEditingController();
    final db = ref.watch(sembastDatabaseProvider).requireValue;

    var uuid = const Uuid();
    String todoId = uuid.v1();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'Enter Your Todo Title',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                  if (titleController.text.isEmpty) {
                    return;
                  } else {
                    ref.read(sembastRepositoryProvider(db).notifier).addTodo(
                        Todo(
                            title: titleController.text,
                            userId: '1',
                            id: todoId));
                    AutoRouter.of(context).pop();
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Add Todo',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
