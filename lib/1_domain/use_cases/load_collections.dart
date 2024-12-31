import 'package:either_dart/either.dart';
import 'package:web_demo/1_domain/entities/todo_collections.dart';
import 'package:web_demo/1_domain/failures/failures.dart';
import 'package:web_demo/1_domain/repositories/todo_repository.dart';
import 'package:web_demo/2_application/core/use_case.dart';

class LoadCollections implements UseCase<List<ToDoCollections>, NoParams> {
  const LoadCollections({required this.toDoRepository});
  final ToDoRepository toDoRepository;
  @override
  Future<Either<Failures, List<ToDoCollections>>> call(NoParams params) async {
    try {
      final loadCollections = toDoRepository.readToDoCollections();
      return loadCollections.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(stackTrace: e.toString()),
      );
    }
  }
}
