import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/1_domain/repositories/todo_repository.dart';
import 'package:web_demo/1_domain/use_cases/load_todo_entry.dart';
import 'package:web_demo/1_domain/use_cases/update_todo_entry.dart';
import 'package:web_demo/2_application/components/to_do_entry_items/bloc/todo_entry_item_cubit.dart';
import 'package:web_demo/2_application/components/to_do_entry_items/view_state/todo_entry_item_error.dart';
import 'package:web_demo/2_application/components/to_do_entry_items/view_state/todo_entry_item_loaded.dart';
import 'package:web_demo/2_application/components/to_do_entry_items/view_state/todo_entry_item_loading.dart';

class ToDoEntryItemProvider extends StatelessWidget {
  const ToDoEntryItemProvider({
    super.key,
    required this.entryId,
    required this.collectionId,
  });

  final EntryId entryId;
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoEntryItemCubit>(
      create: (context) => TodoEntryItemCubit(
          entryId: entryId,
          loadTodoEntry: LoadTodoEntry(
            toDoRepository: RepositoryProvider.of<ToDoRepository>(context),
          ),
          collectionId: collectionId,
          uploadToDoEntry: UpdateTodoEntry(
            toDoRepository: RepositoryProvider.of<ToDoRepository>(context),
          ))
        ..fetch(),
      child: TodoEntryItem(),
    );
  }
}

class TodoEntryItem extends StatelessWidget {
  const TodoEntryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoEntryItemCubit, TodoEntryItemCubitSatate>(
        builder: (context, state) {
      if (state is TodoEntryItemLoadingState) {
        return TodoEntryItemLoading();
      } else if (state is TodoEntryItemLoadedState) {
        return TodoEntryItemLoaded(
          entryItem: state.todoEntry,
          onChange: (value) => context.read<TodoEntryItemCubit>().update(),
        );
      } else {
        return TodoEntryItemError();
      }
    });
  }
}
