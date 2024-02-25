import 'package:flutter/material.dart';

import 'package:moka_todo_list/widgets/todo_item.dart';

import '../models/todo.dart';
import '../size_config.dart';
import '../widgets/header_image.dart';
import '../widgets/title_section.dart';

class UncompletedTodoScreen extends StatefulWidget {
  const UncompletedTodoScreen({
    super.key,
    required this.todos,
  });

  final List<Todo> todos;

  @override
  State<UncompletedTodoScreen> createState() => _UncompletedTodoScreenState();
}

class _UncompletedTodoScreenState extends State<UncompletedTodoScreen> {
  final _titleController = TextEditingController();
  final _detailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _detailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            buttonAddTodo(context),
            const SizedBox(height: 28.0),
            const TitleSection(text: 'UNCOMPLETED TASK'),
            const SizedBox(height: 12.0),
            Expanded(
                child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView(
                children: [
                  for (final todo in widget.todos)
                    TodoItem(
                      todo: todo,
                      onLongPress: () {},
                      onTap: () {},
                    ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Card buttonAddTodo(BuildContext context) {
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
          onPressed: () {},
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
