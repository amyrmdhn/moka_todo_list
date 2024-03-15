import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import '../models/todo.dart';

Future<Database> _getUncompletedTodoDatabase() async {
  final dbPath = await sql.getDatabasesPath();

  final db = await sql.openDatabase(
    path.join(dbPath, 'uncompletedTodo.db'),
    version: 1,
    onCreate: (db, version) => db.execute(
      'CREATE TABLE UncompletedTodo(id TEXT PRIMARY KEY, title TEXT, detail TEXT, date TEXT)',
    ),
  );

  return db;
}

Future<Database> _getCTodo() async {
  final dbPath = await sql.getDatabasesPath();

  final db = await sql.openDatabase(
    path.join(dbPath, 'ctodo.db'),
    version: 1,
    onCreate: (db, version) => db.execute(
      'CREATE TABLE CTODO(id TEXT PRIMARY KEY, title TEXT, detail TEXT, date TEXT)',
    ),
  );

  return db;
}

class UncompletedTodoNotifier extends StateNotifier<List<Todo>> {
  UncompletedTodoNotifier() : super([]);

  Future<void> loadUncompletedTodo() async {
    final db = await _getUncompletedTodoDatabase();

    final data = await db.query('UncompletedTodo');

    final todos = data
        .map(
          (row) => Todo(
            id: row['id'] as String,
            title: row['title'] as String,
            detail: row['detail'] as String,
            date: DateTime.parse(row['date'] as String),
          ),
        )
        .toList();

    state = todos;
  }

  void addTodo(Todo todo) async {
    final db = await _getUncompletedTodoDatabase();

    db.insert(
      'UncompletedTodo',
      {
        'id': todo.id,
        'title': todo.title,
        'detail': todo.detail,
        'date': todo.date.toString(),
      },
    );

    state = [todo, ...state];
    state.sort((a, b) {
      return -a.date.compareTo(b.date);
    });
  }

  void removeTodo(Todo todo) async {
    final db = await _getUncompletedTodoDatabase();

    db.delete(
      'UncompletedTodo',
      where: 'id = ?',
      whereArgs: [todo.id],
    );

    state = state.where((e) => e != todo).toList();
    state.sort((a, b) {
      return -a.date.compareTo(b.date);
    });
  }
}

class CompletedTodoNotifier extends StateNotifier<List<Todo>> {
  CompletedTodoNotifier() : super([]);

  Future<void> loadCompletedTodo() async {
    final db = await _getCTodo();

    final data = await db.query('CTODO');

    final todos = data
        .map(
          (row) => Todo(
            id: row['id'] as String,
            title: row['title'] as String,
            detail: row['detail'] as String,
            date: DateTime.parse(row['date'] as String),
          ),
        )
        .toList();

    state = todos;
  }

  void markAsCompletedTodo(Todo todo) async {
    final db = await _getCTodo();

    print(db);

    db.insert(
      'CTODO',
      {
        'id': todo.id,
        'title': todo.title,
        'detail': todo.detail,
        'date': todo.date.toString(),
      },
    );

    state = [todo, ...state];
    state.sort((a, b) {
      return -a.date.compareTo(b.date);
    });
  }

  void markAsNotCompletedTodo(Todo todo) async {
    final db = await _getCTodo();

    db.delete(
      'CTODO',
      where: 'id = ?',
      whereArgs: [todo.id],
    );
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
