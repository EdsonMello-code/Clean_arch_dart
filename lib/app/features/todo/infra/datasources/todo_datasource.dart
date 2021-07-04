import 'package:clean_arch/app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch/app/features/todo/domain/useCases/change_todo_usecase.dart';

abstract class TodoDatasource {
  Future<void> createTodoDatasource(String name, int isDone);
  Future<List<TodoEntity>> listTodoDatasource();
  Future<void> changeTodoDatasource(ChangeTodoUsecaseDTO params);
}
