import 'dart:async';

import 'package:clean_arch/app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch/app/features/todo/domain/useCases/change_todo_usecase.dart';
import 'package:clean_arch/app/features/todo/domain/useCases/create_todo_usecase.dart';
import 'package:clean_arch/app/features/todo/domain/useCases/list_todo_usecase.dart';
import 'package:clean_arch/app/features/todo/externals/datasources/todo_datasource_impl.dart';
import 'package:clean_arch/app/features/todo/infra/repositories/todo_repository_impl.dart';
import 'package:flutter/material.dart';

enum StateTodoController { error, success, start, loading }

class TodoController extends ChangeNotifier {
  List<TodoEntity> todos = [];
  StateTodoController state = StateTodoController.start;

  Future<void> loadTodo() async {
    final todoUsecase = ListTodoUseCase(
      todoRespository: TodoRepositoryImpl(
        datasource: TodoDataSourceImpl(),
      ),
    );
    state = StateTodoController.loading;
    notifyListeners();
    final called = await todoUsecase();
    called.fold((l) {
      state = StateTodoController.error;
      notifyListeners();
    }, (r) {
      todos = r;
      state = StateTodoController.success;
      notifyListeners();
    });
  }

  Future<void> createTodo({required String name, required int isDone}) async {
    final createTodoUsecase = CreateTodoUseCase(
        todoRepository: TodoRepositoryImpl(datasource: TodoDataSourceImpl()));
    await createTodoUsecase.call(TodoInfo(name: name, isDone: isDone));
    loadTodo();
  }

  Future<void> updateTodo(ChangeTodoUsecaseDTO params) async {
    final updateUsecase = ChangeTodoUsecase(
        todoRepository: TodoRepositoryImpl(datasource: TodoDataSourceImpl()));

    updateUsecase.call(params);
    loadTodo();
  }
}
