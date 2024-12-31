import 'package:either_dart/either.dart';
import 'package:web_demo/1_domain/entities/todo_collections.dart';
import 'package:web_demo/1_domain/entities/todo_color.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/1_domain/failures/failures.dart';
import 'package:web_demo/1_domain/repositories/todo_repository.dart';

class TodoRepositoryMock implements ToDoRepository {
  @override
  Future<Either<Failures, List<ToDoCollections>>> readToDoCollections() {
    final list = List<ToDoCollections>.generate(
      10,
      (index) => ToDoCollections(
          id: CollectionId.fromUniqueString(index.toString()),
          color:
              ToDoColor(colorIndex: index % ToDoColor.predefinedColors.length),
          title: 'title $index'),
    );

    return Future.delayed(
      Duration(microseconds: 200),
      () => Right(list),
    );
  }
}
