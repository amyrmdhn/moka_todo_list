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

class CompletedTodoNotifier extends StateNotifier<List<Todo>> {
  CompletedTodoNotifier() : super([]);

  void markAsCompletedTodo(Todo todo) {
    state = [todo, ...state];
  }

  void markAsNotCompletedTodo(Todo todo) {
    state = state.where((e) => e != todo).toList();
  }
}

final uncompletedTodoProvider =
    StateNotifierProvider<UncompletedTodoNotifier, List<Todo>>(
  (ref) => UncompletedTodoNotifier(),
);

final completedTodoProvider =
    StateNotifierProvider<CompletedTodoNotifier, List<Todo>>(
  (ref) => CompletedTodoNotifier(),
);
