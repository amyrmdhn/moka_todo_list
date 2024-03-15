import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../size_config.dart';

import '../models/todo.dart';
import '../providers/date_provider.dart';
import '../providers/todos_provider.dart';

class NewTodo extends ConsumerStatefulWidget {
  const NewTodo({
    super.key,
  });

  @override
  ConsumerState<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends ConsumerState<NewTodo> {
  final _titleController = TextEditingController();
  final _detailController = TextEditingController();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month, now.day);

    var pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );

    ref.read(dateProvider.notifier).selectedDate(pickedDate!);
  }

  void _submitTodo(DateTime? selectedDate) async {
    if (_titleController.text.trim().isEmpty ||
        _detailController.text.trim().isEmpty ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Input is invalid'),
          content: const Text('Please make sure a valid input was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

      return;
    }

    ref.read(uncompletedTodoProvider.notifier).addTodo(
          Todo(
            title: _titleController.text,
            detail: _detailController.text,
            date: selectedDate,
          ),
        );

    ref.invalidate(dateProvider);

    if (!context.mounted) return;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _detailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(dateProvider);

    var isSelectedDate =
        selectedDate == null ? 'Selected Date' : formatter.format(selectedDate);

    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSize + 16),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: getProportionateScreenHeight(12)),
            TextField(
              controller: _detailController,
              decoration: const InputDecoration(labelText: 'Detail Todo'),
            ),
            SizedBox(height: getProportionateScreenHeight(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(isSelectedDate),
                IconButton(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                SizedBox(width: getProportionateScreenWidth(8)),
                ElevatedButton(
                  onPressed: () {
                    _submitTodo(selectedDate);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
