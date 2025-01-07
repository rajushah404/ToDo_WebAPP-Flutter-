import 'package:either_dart/either.dart';
import 'package:web_demo/1_domain/entities/todo_collections.dart';
import 'package:web_demo/1_domain/entities/todo_entry.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/1_domain/failures/failures.dart';

abstract class ToDoRepository {
  Future<Either<Failures, List<ToDoCollections>>> readToDoCollections();

  Future<Either<Failures, TodoEntry>> readTodoEntry(
      CollectionId collectionId, EntryId entryId);

  Future<Either<Failures, List<EntryId>>> readToDoEntryIds(
      CollectionId collectionId);
}
