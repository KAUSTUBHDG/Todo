import 'package:dosh/domain/enums/todo_staus_enum.dart';

class TodoEntity {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  final TodoStatus status;

  TodoEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  }) : status = completed ? TodoStatus.done : TodoStatus.pending;

  TodoEntity copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
    TodoStatus? status,
  }) {
    return TodoEntity(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
