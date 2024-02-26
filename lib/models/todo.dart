import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  Todo({
    required this.title,
    required this.detail,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String detail;
  final DateTime date;
}
