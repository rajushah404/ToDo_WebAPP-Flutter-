part of 'todo_overview_cubit.dart';

sealed class TodoOverviewState extends Equatable {
  const TodoOverviewState();

  @override
  List<Object> get props => [];
}

final class TodoOverviewInitialState extends TodoOverviewState {}

final class TodoOverviewLoadingState extends TodoOverviewState {}

final class TodoOverviewLoadedState extends TodoOverviewState {
  const TodoOverviewLoadedState({required this.collections});
  final List<ToDoCollections> collections;
  @override
  List<Object> get props => [collections];
}

final class TodoOverviewErrorState extends TodoOverviewState {}
