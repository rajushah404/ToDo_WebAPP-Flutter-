import 'package:flutter/material.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/2_application/components/to_do_entry_items/todo_entry_item.dart';

class TodoDetailsLoaded extends StatelessWidget {
  const TodoDetailsLoaded(
      {super.key, required this.entryIds, required this.collectionId});

  final List<EntryId> entryIds;
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: entryIds.length,
            itemBuilder: (context, index) => ToDoEntryItemProvider(
                  collectionId: collectionId,
                  entryId: entryIds[index],
                )),
      ),
    );
  }
}
