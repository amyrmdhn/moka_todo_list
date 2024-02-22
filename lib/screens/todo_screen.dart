import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moka_todo_list/widgets/todo_item.dart';

import '../models/todo.dart';
import '../size_config.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({
    super.key,
    this.isUncompletedScreen = false,
    required this.todos,
  });

  final List<Todo> todos;
  final bool isUncompletedScreen;

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
            SvgPicture.asset(
              'assets/images/header_uncompleted_task.svg',
              height: getProportionateScreenHeight(250),
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            if (isUncompletedScreen) buttonAddTodo(context),
            const SizedBox(height: 28.0),
            titleSection(),
            const SizedBox(height: 12.0),
            Expanded(
                child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView(
                children: [
                  for (final todo in todos)
                    TodoItem(
                      todo: todo,
                      onLongPress: () {
                        print('Test on Long Press');
                      },
                      onTap: () {
                        print('Test on Tap');
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

  Text titleSection() {
    return Text(
      isUncompletedScreen ? 'UNCOMPLETED TASK' : 'COMPLETED TASK',
      style: textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.bold,
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
