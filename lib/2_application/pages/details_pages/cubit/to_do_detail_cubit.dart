import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/1_domain/use_cases/load_todo_entry_ids_for_collection.dart';
import 'package:web_demo/1_domain/use_cases/use_case.dart';

part 'to_do_detail_state.dart';

class ToDoDetailCubit extends Cubit<ToDoDetailState> {
  ToDoDetailCubit(
      {required this.collectionId, required this.loadToDoEntryIdsForCollection})
      : super(ToDoDetailLoading());
  final CollectionId collectionId;
  final LoadTodoEntryIdsForCollection loadToDoEntryIdsForCollection;

  Future<void> fetch() async {
    emit(ToDoDetailLoading());
    try {
      final entryIds = await loadToDoEntryIdsForCollection
          .call(CollectionIdParam(collectionId: collectionId));
      if (entryIds.isLeft) {
        emit(ToDoDetailError());
      } else {
        emit(ToDoDetailLoaded(entryIds: entryIds.right));
      }
    } on Exception {
      emit(ToDoDetailError());
    }
  }
}
