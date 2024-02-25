import 'package:flutter/material.dart';

import '../size_config.dart';
import '../models/todo.dart';
import '../widgets/header_image.dart';
import '../widgets/title_section.dart';
import '../widgets/todo_item.dart';

class CompletedTodoScreen extends StatelessWidget {
  const CompletedTodoScreen({
    super.key,
    required this.completedTodos,
  });

  final List<Todo> completedTodos;

  @override
  Widget build(BuildContext context) {
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
                  todo: completedTodos[index],
                  onTap: () {},
                  onLongPress: () {},
                ),
                itemCount: completedTodos.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
