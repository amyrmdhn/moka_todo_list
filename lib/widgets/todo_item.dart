import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../size_config.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.onLongPress,
    required this.onTap,
  });

  final Todo todo;
  final void Function() onLongPress;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = false;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onLongPress: onLongPress,
        child: Card(
          margin: EdgeInsets.zero,
          color: Theme.of(context).colorScheme.background,
          child: ListTile(
            onTap: onTap,
            leading: isCompleted
                ? const Icon(Icons.done)
                : Icon(
                    Icons.circle_outlined,
                    size: getProportionateScreenHeight(20),
                  ),
            title: Text(
              todo.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleSmall!.copyWith(
                color: colorScheme.onBackground,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Text(
              'Today',
              style: textTheme.titleSmall!.copyWith(
                color: todo.title == 'Today'
                    ? colorScheme.error
                    : colorScheme.onBackground,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
