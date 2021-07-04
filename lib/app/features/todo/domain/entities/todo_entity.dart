class TodoEntity {
  final int? id;
  final String name;
  int isDone;

  TodoEntity({this.id, required this.name, this.isDone = 0});
}
