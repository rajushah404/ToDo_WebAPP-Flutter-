import 'package:either_dart/either.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/1_domain/failures/failures.dart';
import 'package:web_demo/1_domain/repositories/todo_repository.dart';
import 'package:web_demo/1_domain/use_cases/use_case.dart';

class LoadTodoEntryIdsForCollection
    implements UseCase<List<EntryId>, CollectionIdParam> {
  LoadTodoEntryIdsForCollection({required this.toDoRepository});
  final ToDoRepository toDoRepository;
  @override
  Future<Either<Failures, List<EntryId>>> call(CollectionIdParam params) async {
    try {
      final loadedIds = toDoRepository.readToDoEntryIds(params.collectionId);
      return loadedIds.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
