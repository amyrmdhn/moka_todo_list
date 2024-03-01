import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

class UncompletedTodoNotifier extends StateNotifier<List<Todo>> {
  UncompletedTodoNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [todo, ...state];
    state.sort((a, b) {
      return -a.date.compareTo(b.date);
    });
  }

  void removeTodo(Todo todo) {
    state = state.where((e) => e != todo).toList();
    state.sort((a, b) {
      return -a.date.compareTo(b.date);
    });
  }

  void remodeTodoByID(Map<String, dynamic> ids) {
    state = state.where((e) => e.id != ids['name']).toList();
    state.sort((a, b) {
      return -a.date.compareTo(b.date);
    });
  }
}

class CompletedTodoNotifier extends StateNotifier<List<Todo>> {
  CompletedTodoNotifier() : super([]);

  void markAsCompletedTodo(Todo todo) {
    state = [todo, ...state];
    state.sort((a, b) {
      return -a.date.compareTo(b.date);
    });
  }

  void markAsNotCompletedTodo(Todo todo) {
    state = state.where((e) => e != todo).toList();
    state.sort((a, b) {
      return -a.date.compareTo(b.date);
    });
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
