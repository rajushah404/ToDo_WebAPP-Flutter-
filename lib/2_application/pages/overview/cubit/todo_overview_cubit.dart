import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_demo/1_domain/entities/todo_collections.dart';
import 'package:web_demo/1_domain/use_cases/load_collections.dart';
import 'package:web_demo/1_domain/use_cases/use_case.dart';

part 'todo_overview_state.dart';

class TodoOverviewCubit extends Cubit<TodoOverviewState> {
  TodoOverviewCubit(this.loadCollections) : super(TodoOverviewInitialState());

  final LoadCollections loadCollections;

  Future<void> readToDoCollections() async {
    emit(TodoOverviewLoadingState());
    try {
      final collectionFuture = loadCollections.call(NoParams());
      final collections = await collectionFuture;

      if (collections.isLeft) {
        emit(TodoOverviewErrorState());
      } else {
        emit(TodoOverviewLoadedState(collections: collections.right));
      }
    } on Exception {
      emit(TodoOverviewErrorState());
    }
  }
}
