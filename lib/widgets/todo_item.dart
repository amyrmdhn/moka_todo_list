import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../size_config.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.onLongPress,
    required this.onTap,
    required this.isCompleted,
  });

  final Todo todo;
  final bool isCompleted;
  final void Function() onLongPress;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final today = formatter.format(DateTime.now());
    final dateData = formatter.format(todo.date);

    final isToday = dateData == today ? 'Today' : dateData;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onLongPress: onLongPress,
        child: Card(
          margin: EdgeInsets.zero,
          color: colorScheme.background,
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
              ),
            ),
            trailing: Text(
              isToday,
              style: textTheme.titleSmall!.copyWith(
                color: isToday == 'Today'
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
