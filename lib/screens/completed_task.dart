import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../size_config.dart';
import '../models/todo.dart';
import '../providers/todos_provider.dart';
import '../widgets/header_image.dart';
import '../widgets/title_section.dart';
import '../widgets/todo_item.dart';

class CompletedTodoScreen extends ConsumerStatefulWidget {
  const CompletedTodoScreen({
    super.key,
  });

  @override
  ConsumerState<CompletedTodoScreen> createState() {
    return _CompletedTodoScreenState();
  }
}

class _CompletedTodoScreenState extends ConsumerState<CompletedTodoScreen> {
  late Future<void> _futureCompletedTodo;

  @override
  void initState() {
    super.initState();
    _futureCompletedTodo =
        ref.read(completedTodoProvider.notifier).loadCompletedTodo();
  }

  @override
  Widget build(BuildContext context) {
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
              child: FutureBuilder(
                future: _futureCompletedTodo,
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemBuilder: (context, index) => TodoItem(
                              todo: completedTodo[index],
                              onLongPress: () {
                                _openDetailTodoOverlay(
                                    context, ref, completedTodo[index]);
                              },
                              onRemove: (context) {
                                _removeTodo(context, ref, completedTodo[index]);
                              },
                              onTap: () {
                                _openAddTodoConfirmOverlay(
                                  context,
                                  ref,
                                  completedTodo[index],
                                );
                              },
                              isCompleted: false,
                            ),
                            itemCount: completedTodo.length,
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _removeTodo(BuildContext context, WidgetRef ref, Todo todo) {
    ref.read(completedTodoProvider.notifier).markAsNotCompletedTodo(todo);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Deleted...!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            ref.read(completedTodoProvider.notifier).markAsCompletedTodo(todo);
          },
        ),
      ),
    );
  }

  void _openDetailTodoOverlay(BuildContext context, WidgetRef ref, Todo todo) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(todo.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.detail),
            SizedBox(height: getProportionateScreenHeight(6)),
            Text('Date: ${formatter.format(todo.date)}'),
          ],
        ),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyLarge,
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
