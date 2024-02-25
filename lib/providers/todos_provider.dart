import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

class UncompletedTodoNotifier extends StateNotifier<List<Todo>> {
  UncompletedTodoNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [todo, ...state];
  }

  void removeTodo(Todo todo) {
    state = state.where((e) => e != todo).toList();
  }
}

final ucompletedTodoProvider =
    StateNotifierProvider<UncompletedTodoNotifier, List<Todo>>(
  (ref) => UncompletedTodoNotifier(),
);
