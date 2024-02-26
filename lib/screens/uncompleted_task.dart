import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../size_config.dart';

import '../providers/todos_provider.dart';
import '../widgets/header_image.dart';
import '../widgets/new_todo.dart';
import '../widgets/todo_item.dart';
import '../widgets/title_section.dart';

class UncompletedTodoScreen extends ConsumerWidget {
  const UncompletedTodoScreen({
    super.key,
  });

  void _openAddTodoOverlay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const NewTodo(),
      isScrollControlled: true,
      useSafeArea: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var uncompletedTodos = ref.watch(uncompletedTodoProvider);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderImage(
              path: 'assets/images/header_uncompleted_task.svg',
            ),
            buttonAddTodo(context, _openAddTodoOverlay),
            const SizedBox(height: 28.0),
            const TitleSection(text: 'UNCOMPLETED TASK'),
            const SizedBox(height: 12.0),
            Expanded(
                child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView(
                children: [
                  for (final todo in uncompletedTodos)
                    TodoItem(
                      isCompleted: false,
                      todo: todo,
                      onLongPress: () {},
                      onTap: () {
                        ref
                            .read(uncompletedTodoProvider.notifier)
                            .removeTodo(todo);
                        ref
                            .read(completedTodoProvider.notifier)
                            .markAsCompletedTodo(todo);
                      },
                    ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Card buttonAddTodo(
      BuildContext context, void Function(BuildContext context) openAddTodo) {
    return Card(
      margin: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.background,
      child: ListTile(
        leading: Text(
          'Add your tasks',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleSmall!.copyWith(
            color: colorScheme.onBackground,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            openAddTodo(context);
          },
          icon: Icon(
            Icons.add_box,
            color: colorScheme.primary,
            size: 30,
          ),
        ),
      ),
    );
  }
}
