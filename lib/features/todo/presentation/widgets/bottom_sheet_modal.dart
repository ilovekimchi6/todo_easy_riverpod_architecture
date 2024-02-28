import 'package:todo_easy_riverpod_architecture/core/common_providers/sembast_db.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/models/todo.dart';
import 'package:todo_easy_riverpod_architecture/features/todo/repositories/sembast_todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Common widgets are widgets that are used in [multiple places] in the same FEATURE.
/// Please note `feature`, not the entire app.

class AddUpdateTodoModal extends StatefulHookConsumerWidget {
  final String? initialTitle;
  final Todo? todo;

  const AddUpdateTodoModal({super.key, this.initialTitle, this.todo});

  @override
  ConsumerState<AddUpdateTodoModal> createState() => _AddUpdateTodoModalState();
}

class _AddUpdateTodoModalState extends ConsumerState<AddUpdateTodoModal> {
  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController(text: widget.initialTitle);
    final db = ref.watch(sembastDatabaseProvider).requireValue;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Todo Title'),
          ),
          ElevatedButton(
            child: Text(widget.initialTitle == null ? 'Add' : 'Update'),
            onPressed: () async {
              try {
                await ref
                    .read(sembastRepositoryProvider(db).notifier)
                    .updateTodoById(widget.todo!.id,
                        widget.todo!.copyWith(title: titleController.text));

                if (mounted) {
                  Navigator.pop(context);
                }
              } catch (error) {}
            },
          ),
        ],
      ),
    );
  }
}
