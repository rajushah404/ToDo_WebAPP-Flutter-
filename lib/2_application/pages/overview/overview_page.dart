import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_demo/1_domain/use_cases/load_collections.dart';
import 'package:web_demo/2_application/core/page_config.dart';
import 'package:web_demo/2_application/pages/overview/cubit/todo_overview_cubit.dart';
import 'package:web_demo/2_application/pages/overview/view_state/todo_overview_error.dart';
import 'package:web_demo/2_application/pages/overview/view_state/todo_overview_lodaing.dart';
import 'package:web_demo/2_application/pages/overview/view_state/todo_overview_loaded.dart';

class ToDoOverviewPageProvider extends StatelessWidget {
  const ToDoOverviewPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoOverviewCubit(
          LoadCollections(toDoRepository: RepositoryProvider.of(context)))
        ..readToDoCollections(),
      child: OverviewPage(),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
      icon: Icons.work_history_outlined,
      name: 'overview',
      child: ToDoOverviewPageProvider());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoOverviewCubit, TodoOverviewState>(
      builder: (context, state) {
        if (state is TodoOverviewLoadingState) {
          return TodoOverviewLodaing();
        } else if (state is TodoOverviewLoadedState) {
          return TodoOverviewLoaded(
            collections: state.collections,
          );
        } else {
          return TodoOverviewError();
        }
      },
    );
  }
}
