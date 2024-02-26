import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../size_config.dart';
import '../models/todo.dart';
import '../providers/todos_provider.dart';
import '../widgets/header_image.dart';
import '../widgets/title_section.dart';
import '../widgets/todo_item.dart';

class CompletedTodoScreen extends ConsumerWidget {
  const CompletedTodoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTodo = ref.watch(completedTodoProvider);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderImage(path: 'assets/images/header_completed_task.svg'),
            const TitleSection(text: 'COMPLETED TASK'),
            SizedBox(height: getProportionateScreenHeight(28)),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => TodoItem(
                  isCompleted: true,
                  todo: completedTodo[index],
                  onTap: () {
                    _openAddTodoConfirmOverlay(
                      context,
                      ref,
                      completedTodo[index],
                    );
                  },
                  onLongPress: () {},
                ),
                itemCount: completedTodo.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openAddTodoConfirmOverlay(
      BuildContext context, WidgetRef ref, Todo todo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Are you sure returned it as uncompleted?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(completedTodoProvider.notifier)
                  .markAsNotCompletedTodo(todo);

              ref.read(uncompletedTodoProvider.notifier).addTodo(todo);

              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
            ),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
