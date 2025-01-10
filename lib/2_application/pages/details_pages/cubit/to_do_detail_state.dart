part of 'to_do_detail_cubit.dart';

sealed class ToDoDetailState extends Equatable {
  const ToDoDetailState();

  @override
  List<Object> get props => [];
}

final class ToDoDetailInitial extends ToDoDetailState {}

final class ToDoDetailLoading extends ToDoDetailState {}

final class ToDoDetailError extends ToDoDetailState {}

final class ToDoDetailLoaded extends ToDoDetailState {
  const ToDoDetailLoaded({required this.entryIds});
  final List<EntryId> entryIds;
  @override
  List<Object> get props => [entryIds];
}
