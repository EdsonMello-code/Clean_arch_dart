import 'package:clean_arch/app/features/todo/domain/repositories/todo_repository.dart';

abstract class IChangeTodoUsecase {
  Future<void> call(ChangeTodoUsecaseDTO params);
}

class ChangeTodoUsecase implements IChangeTodoUsecase {
  final ITodoRepository todoRepository;

  ChangeTodoUsecase({required this.todoRepository});

  @override
  Future<void> call(ChangeTodoUsecaseDTO params) async {
    await todoRepository.changeTodo(params);
  }
}

class ChangeTodoUsecaseDTO {
  final int id;
  final int newValue;

  ChangeTodoUsecaseDTO({required this.id, required this.newValue});
}
