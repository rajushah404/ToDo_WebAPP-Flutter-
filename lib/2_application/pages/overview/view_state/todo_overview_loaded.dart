import 'package:flutter/material.dart';
import 'package:web_demo/1_domain/entities/todo_collections.dart';

class TodoOverviewLoaded extends StatelessWidget {
  const TodoOverviewLoaded({
    super.key,
    required this.collections,
  });
  final List<ToDoCollections> collections;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        final colorScheme = Theme.of(context).colorScheme;
        return ListTile(
          tileColor: colorScheme.surface,
          selectedTileColor: colorScheme.onSurfaceVariant,
          iconColor: item.color.color,
          selectedColor: item.color.color,
          onTap: () => debugPrint(item.title),
          leading: const Icon(Icons.circle),
          title: Text(item.title),
        );
      },
    );
  }
}
