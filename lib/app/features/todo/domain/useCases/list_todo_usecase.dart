import 'package:clean_arch/app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch/app/features/todo/domain/errors/todo_erro.dart';
import 'package:clean_arch/app/features/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IListTodoUseCase {
  Future<Either<TodoError, List<TodoEntity>>> call();
}

class ListTodoUseCase implements IListTodoUseCase {
  final ITodoRepository todoRespository;

  ListTodoUseCase({required this.todoRespository});

  @override
  Future<Either<TodoError, List<TodoEntity>>> call() async {
    final list = await todoRespository.listTodo();
    return list;
  }
}
