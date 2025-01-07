import 'package:web_demo/1_domain/entities/unique_id.dart';

class TodoEntry {
  final String description;
  final bool isDone;
  final EntryId id;

  const TodoEntry(
      {required this.description, required this.id, required this.isDone});

  factory TodoEntry.empty() {
    return TodoEntry(description: '', id: EntryId(), isDone: false);
  }
}
