import 'package:either_dart/either.dart';
import 'package:web_demo/1_domain/entities/todo_collections.dart';
import 'package:web_demo/1_domain/failures/failures.dart';

abstract class ToDoRepository {
  Future<Either<Failures, List<ToDoCollections>>> readToDoCollections();
}
