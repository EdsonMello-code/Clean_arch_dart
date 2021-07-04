import 'package:clean_arch/app/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  final String name;

  final int isDone;
  final int id;

  TodoModel({required this.name, required this.isDone, required this.id})
      : super(name: name);
  // TodoModel() : super(name: '', isDone: true);
  factory TodoModel.fromMap(map) {
    return TodoModel(name: map['name'], isDone: map['isDone'], id: map['id']);
  }
}
