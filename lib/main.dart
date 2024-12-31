import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_demo/0_data/repositories/todo_repository_mock.dart';
import 'package:web_demo/1_domain/repositories/todo_repository.dart';
import 'package:web_demo/2_application/app/basic_app.dart';

void main() {
  runApp(RepositoryProvider<ToDoRepository>(
    create: (context) => TodoRepositoryMock(),
    child: const BasicApp(),
  ));
}
