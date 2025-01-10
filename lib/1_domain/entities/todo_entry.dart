import 'package:equatable/equatable.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';

class TodoEntry extends Equatable {
  final String description;
  final bool isDone;
  final EntryId id;

  const TodoEntry(
      {required this.description, required this.id, required this.isDone});

  factory TodoEntry.empty() {
    return TodoEntry(description: '', id: EntryId(), isDone: false);
  }

  TodoEntry copyWith({String? description, bool? isDone}) {
    return TodoEntry(
        description: description ?? this.description,
        id: id,
        isDone: isDone ?? this.isDone);
  }

  @override
  List<Object?> get props => [id, isDone, description];
}
