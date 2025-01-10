import 'package:flutter/material.dart';
import 'package:web_demo/1_domain/entities/todo_entry.dart';

class TodoEntryItemLoaded extends StatelessWidget {
  const TodoEntryItemLoaded(
      {super.key, required this.entryItem, required this.onChange});
  final TodoEntry entryItem;

  final Function(bool?) onChange;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: entryItem.isDone,
      onChanged: onChange,
      title: Text(entryItem.description),
    );
  }
}
