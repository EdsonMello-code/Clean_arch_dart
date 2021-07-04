import 'package:clean_arch/app/features/todo/domain/errors/todo_erro.dart';
import 'package:clean_arch/app/features/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

// D => SOLID: depender de interface e não de implementação
abstract class ICreateTodoUseCase {
  Future<Either<TodoError, void>> call(TodoInfo params);
}

// useCase do todo => Irá fazer validações e chama respository ou service
class CreateTodoUseCase implements ICreateTodoUseCase {
  final ITodoRepository todoRepository;

  CreateTodoUseCase({required this.todoRepository});

  @override
  Future<Either<TodoError, void>> call(TodoInfo params) async {
    if (params.name.isEmpty) {
      return left(TodoError(message: 'O nome da tarefa não pode ser vazio.'));
    }

    await todoRepository.createTodo(params);
    return right('');
  }
}

// se precisar adicionar mais parâmetros, adiciono aqui.

// Isso é do clean code
class TodoInfo {
  final int? id;
  final String name;
  final int isDone;

  TodoInfo({this.id, required this.name, this.isDone = 0});
}
