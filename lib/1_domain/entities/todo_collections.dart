import 'package:web_demo/1_domain/entities/todo_color.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';

class ToDoCollections {
  final String title;
  final ToDoColor color;
  final CollectionId id;

  ToDoCollections({
    required this.id,
    required this.color,
    required this.title,
  });

  factory ToDoCollections.empty() {
    return ToDoCollections(
      id: CollectionId(),
      title: '',
      color: ToDoColor(colorIndex: 0),
    );
  }
}
