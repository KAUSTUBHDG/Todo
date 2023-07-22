part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => <Object?>[];
}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final Map<int, List<TodoEntity>> pendingTodos;
  final Map<int, List<TodoEntity>> doneTodos;
  const TodoLoaded({required this.pendingTodos, required this.doneTodos});

  @override
  List<Object?> get props => [pendingTodos, doneTodos];
}

class TodoFailure extends TodoState {
  final FailureEntity failure;
  const TodoFailure({required this.failure});
}
