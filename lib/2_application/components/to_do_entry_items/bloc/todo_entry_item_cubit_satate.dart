part of 'todo_entry_item_cubit.dart';

abstract class TodoEntryItemCubitSatate extends Equatable {
  const TodoEntryItemCubitSatate();
  @override
  List<Object> get props => [];
}

class TodoEntryItemLoadingState extends TodoEntryItemCubitSatate {}

class TodoEntryItemErrorState extends TodoEntryItemCubitSatate {}

class TodoEntryItemLoadedState extends TodoEntryItemCubitSatate {
  const TodoEntryItemLoadedState({required this.todoEntry});
  final TodoEntry todoEntry;

  @override
  List<Object> get props => [todoEntry];
}
