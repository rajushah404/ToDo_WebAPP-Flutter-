import 'package:either_dart/either.dart';
import 'package:web_demo/1_domain/entities/todo_collections.dart';
import 'package:web_demo/1_domain/entities/todo_color.dart';
import 'package:web_demo/1_domain/entities/todo_entry.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/1_domain/failures/failures.dart';
import 'package:web_demo/1_domain/repositories/todo_repository.dart';

class TodoRepositoryMock implements ToDoRepository {
  final toDoEntries = List<TodoEntry>.generate(
      100,
      (index) => TodoEntry(
          description: "description $index",
          id: EntryId.fromUniqueString(index.toString()),
          isDone: false));

  final todoCollection = List<ToDoCollections>.generate(
    10,
    (index) => ToDoCollections(
        id: CollectionId.fromUniqueString(index.toString()),
        color: ToDoColor(colorIndex: index % ToDoColor.predefinedColors.length),
        title: 'title $index'),
  );

  @override
  Future<Either<Failures, List<ToDoCollections>>> readToDoCollections() {
    try {
      return Future.delayed(
        Duration(microseconds: 200),
        () => Right(todoCollection),
      );
    } on Exception catch (e) {
      return Future.value(
        Left(
          ServerFailure(
            stackTrace: e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<EntryId>>> readToDoEntryIds(
      CollectionId collectionId) {
    try {
      final startIndex = int.parse(collectionId.value) * 10;
      final endIndex = startIndex + 10;
      final entryIds = toDoEntries
          .sublist(startIndex, endIndex)
          .map((entry) => entry.id)
          .toList();
      return Future.delayed(Duration(microseconds: 300), () => Right(entryIds));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failures, TodoEntry>> readTodoEntry(
      CollectionId collectionId, EntryId entryId) {
    try {
      final selectedEntryItem = toDoEntries.firstWhere(
        (element) => element.id == entryId,
      );
      return Future.delayed(
        Duration(microseconds: 200),
        () => Right(selectedEntryItem),
      );
    } on Exception catch (e) {
      return Future.value(
        Left(
          ServerFailure(
            stackTrace: e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, TodoEntry>> updateToDoEntry(
      {required CollectionId collectionId, required EntryId entryId}) {
    final index = toDoEntries.indexWhere((element) => element.id == entryId);
    final entryToUpdate = toDoEntries[index];
    final updateEntry =
        toDoEntries[index].copyWith(isDone: !entryToUpdate.isDone);

    toDoEntries[index] = updateEntry;
    return Future.delayed(
        Duration(microseconds: 100), () => Right(updateEntry));
  }
}
