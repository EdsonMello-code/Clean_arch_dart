import 'package:clean_arch/app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch/app/features/todo/domain/errors/todo_erro.dart';
import 'package:clean_arch/app/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_arch/app/features/todo/domain/useCases/change_todo_usecase.dart';
import 'package:clean_arch/app/features/todo/infra/datasources/todo_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch/app/features/todo/domain/useCases/create_todo_usecase.dart';

class TodoRepositoryImpl implements ITodoRepository {
  final TodoDatasource datasource;

  TodoRepositoryImpl({required this.datasource});
  @override
  Future<Either<TodoError, void>> createTodo(TodoInfo params) async {
    try {
      await datasource.createTodoDatasource(params.name, params.isDone);
      return right('');
    } on TodoError catch (e) {
      return left(e);
    } on Exception {
      throw Exception('Unexpected error');
    }
  }

  @override
  Future<Either<TodoError, List<TodoEntity>>> listTodo() async {
    try {
      final todos = await datasource.listTodoDatasource();
      return right(todos);
    } on TodoError catch (e) {
      throw left(e);
    } on Exception {
      throw Exception('Unexpected error');
    }
  }

  @override
  Future<Either<TodoError, void>> changeTodo(
      ChangeTodoUsecaseDTO params) async {
    try {
      final todo = await datasource.changeTodoDatasource(params);
      return right('');
    } on TodoError catch (e) {
      return left(e);
    } on Exception {
      throw Exception('Unexpected error');
    }
  }
}
