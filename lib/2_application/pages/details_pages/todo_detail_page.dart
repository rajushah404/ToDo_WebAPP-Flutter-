import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_demo/1_domain/entities/unique_id.dart';
import 'package:web_demo/1_domain/repositories/todo_repository.dart';
import 'package:web_demo/1_domain/use_cases/load_todo_entry_ids_for_collection.dart';
import 'package:web_demo/2_application/core/page_config.dart';
import 'package:web_demo/2_application/pages/details_pages/cubit/to_do_detail_cubit.dart';

class ToDoDetailsPageProvider extends StatelessWidget {
  const ToDoDetailsPageProvider({super.key, required this.collectionId});
  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToDoDetailCubit>(
      create: (context) => ToDoDetailCubit(
        collectionId: collectionId,
        loadToDoEntryIdsForCollection: LoadTodoEntryIdsForCollection(
          toDoRepository: RepositoryProvider.of<ToDoRepository>(context),
        ),
      )..fetch(),
      child: TodoDetailPage(collectionId: collectionId),
    );
  }
}

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({super.key, required this.collectionId});

  final CollectionId collectionId;

  static const pageConfig =
      PageConfig(icon: Icons.details_outlined, name: 'detail');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoDetailCubit, ToDoDetailState>(
        builder: (context, state) {
      return Placeholder();
    });
  }
}
