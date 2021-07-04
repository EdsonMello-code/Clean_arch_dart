// Comunicação com a camada externas por meio de contrato
import 'package:clean_arch/app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch/app/features/todo/domain/errors/todo_erro.dart';
import 'package:clean_arch/app/features/todo/domain/useCases/change_todo_usecase.dart';
import 'package:clean_arch/app/features/todo/domain/useCases/create_todo_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class ITodoRepository {
  Future<Either<TodoError, void>> createTodo(TodoInfo params);
  Future<Either<TodoError, List<TodoEntity>>> listTodo();
  Future<Either<TodoError, void>> changeTodo(ChangeTodoUsecaseDTO params);
}
