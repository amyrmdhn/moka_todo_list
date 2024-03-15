import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  Todo({
    required this.title,
    required this.detail,
    required this.date,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String title;
  final String detail;
  final DateTime date;
}
