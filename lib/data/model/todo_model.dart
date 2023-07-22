import 'package:dosh/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
