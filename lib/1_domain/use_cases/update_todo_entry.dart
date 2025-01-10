import 'package:either_dart/either.dart';
import 'package:web_demo/1_domain/entities/todo_entry.dart';
import 'package:web_demo/1_domain/failures/failures.dart';
import 'package:web_demo/1_domain/repositories/todo_repository.dart';
import 'package:web_demo/1_domain/use_cases/use_case.dart';

class UpdateTodoEntry implements UseCase<TodoEntry, ToDoEntryIdsParam> {
  const UpdateTodoEntry({required this.toDoRepository});
  final ToDoRepository toDoRepository;
  @override
  Future<Either<Failures, TodoEntry>> call(ToDoEntryIdsParam params) async {
    try {
      final loadEntry = await toDoRepository.updateToDoEntry(
          collectionId: params.collectionId, entryId: params.entryId);

      return loadEntry.fold((lelf) => Left(lelf), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
