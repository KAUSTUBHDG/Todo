import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dosh/domain/entities/failure_entity.dart';
import 'package:dosh/domain/entities/todo_entity.dart';
import 'package:dosh/domain/usecase/usecase.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._useCase) : super(TodoInitial()) {
    on<GetDataEvent>(_getTodoData);
    on<UpdateTodoStatusEvent>(_updateTodoStatus);
  }

  final UseCase _useCase;

  FutureOr<void> _getTodoData(
    GetDataEvent event,
    Emitter<TodoState> emit,
  ) async {
    final response = await _useCase.getData();

    response.fold((l) => emit(TodoFailure(failure: l)), (r) {
      final pendingTodos = <int, List<TodoEntity>>{};
      final doneTodos = <int, List<TodoEntity>>{};

      for (var todo in r) {
        if (todo.completed) {
          doneTodos[todo.userId] = [...doneTodos[todo.userId] ?? [], todo];
        } else {
          pendingTodos[todo.userId] = [
            ...pendingTodos[todo.userId] ?? [],
            todo
          ];
        }
      }
      emit(
        TodoLoaded(pendingTodos: pendingTodos, doneTodos: doneTodos),
      );
    });
  }

  FutureOr<void> _updateTodoStatus(
    UpdateTodoStatusEvent event,
    Emitter<TodoState> emit,
  ) async {
    final currentState = state as TodoLoaded;
    final existingPendingList = currentState.pendingTodos[event.todo.userId];
    final existingDoneList = currentState.doneTodos[event.todo.userId];
    if (existingPendingList != null &&
        existingPendingList.contains(event.todo)) {
      final updatedDoneList = List<TodoEntity>.from(existingDoneList ?? [])
        ..add(event.todo);
      final updatedPendingList = List<TodoEntity>.from(existingPendingList)
        ..remove(event.todo);
      emit(TodoLoaded(pendingTodos: {
        ...currentState.pendingTodos,
        event.todo.userId: updatedPendingList,
      }, doneTodos: {
        ...currentState.doneTodos,
        event.todo.userId: updatedDoneList,
      }));
    } else if (existingDoneList != null &&
        existingDoneList.contains(event.todo)) {
      final updatedPendingList =
          List<TodoEntity>.from(existingPendingList ?? [])..add(event.todo);
      final updatedDoneList = List<TodoEntity>.from(existingDoneList)
        ..remove(event.todo);
      emit(TodoLoaded(pendingTodos: {
        ...currentState.pendingTodos,
        event.todo.userId: updatedPendingList,
      }, doneTodos: {
        ...currentState.doneTodos,
        event.todo.userId: updatedDoneList,
      }));
    }
  }
}
