import 'package:auto_route/auto_route.dart';
import 'package:todo_easy_riverpod_architecture/core/common_providers/sembast_db.dart';
import 'package:todo_easy_riverpod_architecture/core/routing/app_router.dart';
import 'package:todo_easy_riverpod_architecture/core/themes/theme.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/models/todo.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/presentation/widgets/bottom_sheet_modal.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/repositories/sembast_todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sembast/sembast.dart';

/// The main screen for displaying [todos].
@RoutePage()
class TodoHomeScreen extends HookConsumerWidget {
  const TodoHomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Get the [Sembast database] from the `provider`.
    Database db = ref.watch(sembastDatabaseProvider).requireValue;

    /// `Watch` the Sembast repository provider to get [todos].
    final sembastData = ref.watch(sembastRepositoryProvider(db));

    /// Function to show the `add/update` [todo modal].
    void showAddUpdateTodoModal(BuildContext context,
        {String? initialTitle, Todo? todo}) {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return AddUpdateTodoModal(initialTitle: initialTitle, todo: todo);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                /// `toggle` theme.
                ref.read(themeNotifierProvider.notifier).toggle();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              /// `Navigate` to the [add todo screen].
              context.pushRoute(const AddTodoRoute());
            },
            child: const Icon(Icons.add)),
        body: switch (sembastData) {
          AsyncData(:final value) => ListView(
              children: [
                for (final todo in value)
                  ListTile(
                    title: Text(todo.title),
                    leading: Checkbox(
                      value: todo.completed,
                      onChanged: (bool? value) {
                        /// Update todo `completion` status logic
                        ref
                            .read(sembastRepositoryProvider(db).notifier)
                            .updateTodoById(
                                todo.id, todo.copyWith(completed: value!));
                      },
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            showAddUpdateTodoModal(context,
                                initialTitle: todo.title, todo: todo);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            /// `Delete` todo logic
                            ref
                                .read(sembastRepositoryProvider(db).notifier)
                                .removeTodoById(todo.id);
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          AsyncError(:final error) => Text('Error: $error'),
          _ => const Center(child: CircularProgressIndicator()),
        });
  }
}
