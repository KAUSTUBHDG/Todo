import 'package:dosh/domain/entities/todo_entity.dart';
import 'package:dosh/presentation/screens/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoTile extends StatelessWidget {
  final TodoEntity todo;

  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      trailing: Checkbox(
        value: todo.completed,
        onChanged: (value) {
          context.read<TodoBloc>().add(UpdateTodoStatusEvent(todo: todo));
        },
      ),
    );
  }
}
