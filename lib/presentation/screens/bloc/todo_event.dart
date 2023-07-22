part of 'todo_bloc.dart';

abstract class TodoEvent {}

class GetDataEvent extends TodoEvent {}

class UpdateTodoStatusEvent extends TodoEvent {
  final TodoEntity todo;

  UpdateTodoStatusEvent({required this.todo});
}
