import 'package:dosh/constants/constants.dart';
import 'package:dosh/di/injector.dart';
import 'package:dosh/presentation/screens/bloc/todo_bloc.dart';
import 'package:dosh/presentation/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (context) => Injector.resolve<TodoBloc>()..add(GetDataEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(Constants.todoApp),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TodoLoaded) {
                return ListView.builder(
                  itemCount: state.pendingTodos.length,
                  itemBuilder: (context, index) {
                    final userId = state.pendingTodos.keys.elementAt(index);
                    return Column(
                      children: [
                        ExpansionTile(
                          title: Text('${Constants.user} $userId '),
                          children: [
                            ExpansionTile(
                              title: const Text(Constants.pending),
                              children: [
                                for (var todo
                                    in state.pendingTodos[userId] ?? []) ...[
                                  TodoTile(todo: todo),
                                ],
                              ],
                            ),
                            ExpansionTile(
                              title: const Text(Constants.done),
                              children: [
                                for (var todo
                                    in state.doneTodos[userId] ?? []) ...[
                                  TodoTile(todo: todo),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              } else if (state is TodoFailure) {
                return Center(
                  child: Text(state.failure.failure),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
