import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/1_domain/use_cases/load_todo_entry.dart';
import 'package:web_demo/1_domain/use_cases/use_case.dart';

import '../../../../1_domain/entities/todo_entry.dart';
import '../../../../1_domain/use_cases/update_todo_entry.dart';

part 'todo_entry_item_cubit_satate.dart';

class TodoEntryItemCubit extends Cubit<TodoEntryItemCubitSatate> {
  TodoEntryItemCubit(
      {required this.entryId,
      required this.collectionId,
      required this.loadTodoEntry,
      required this.uploadToDoEntry})
      : super(TodoEntryItemLoadingState());

  final EntryId entryId;
  final CollectionId collectionId;
  final LoadTodoEntry loadTodoEntry;
  final UpdateTodoEntry uploadToDoEntry;
  Future<void> fetch() async {
    try {
      final entry = await loadTodoEntry.call(
        ToDoEntryIdsParam(
          entryId: entryId,
          collectionId: collectionId,
        ),
      );

      return entry.fold((left) => emit(TodoEntryItemErrorState()),
          (right) => emit(TodoEntryItemLoadedState(todoEntry: right)));
    } on Exception {
      emit(TodoEntryItemErrorState());
    }
  }

  Future<void> update() async {
    try {
      final updatedEntry = await uploadToDoEntry.call(
          ToDoEntryIdsParam(entryId: entryId, collectionId: collectionId));
      return updatedEntry.fold(
        (left) => emit(TodoEntryItemErrorState()),
        (right) => emit(
          TodoEntryItemLoadedState(todoEntry: right),
        ),
      );
    } on Exception {
      emit(
        TodoEntryItemErrorState(),
      );
    }
  }
}
