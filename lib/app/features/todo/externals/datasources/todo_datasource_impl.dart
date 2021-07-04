import 'package:clean_arch/app/features/todo/domain/entities/todo_entity.dart';
import 'package:clean_arch/app/features/todo/domain/errors/todo_erro.dart';
import 'package:clean_arch/app/features/todo/domain/useCases/change_todo_usecase.dart';
import 'package:clean_arch/app/features/todo/infra/datasources/todo_datasource.dart';
import 'package:clean_arch/app/features/todo/infra/models/todo_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sqlite3/sqlite3.dart';

class TodoDataSourceImpl implements TodoDatasource {
  @override
  Future<void> createTodoDatasource(String name, int isDone) async {
    final database = sqlite3.open('todo.db');
    database.execute('''
        CREATE TABLE IF NOT EXISTS todos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          isDone INTEGER NOT NULL CHECK (isDone IN (0,1))
        );
  ''');

    try {
      final sqlInsert =
          database.prepare('INSERT INTO todos (name, isDone) VALUES (?, ?)');

      sqlInsert..execute([name, isDone]);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<TodoEntity>> listTodoDatasource() async {
    final database = sqlite3.open('todo.db');

    database.execute('''
        CREATE TABLE IF NOT EXISTS todos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          isDone INTEGER NOT NULL CHECK (isDone IN (0,1))
        );
  ''');

    final todos = database
        .select('SELECT * FROM todos')
        .map((map) => TodoModel.fromMap(map))
        .toList();
    return todos;
  }

  @override
  Future<void> changeTodoDatasource(ChangeTodoUsecaseDTO params) async {
    final database = sqlite3.open('todo.db');

    try {
      database.execute('''
        CREATE TABLE IF NOT EXISTS todos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          isDone INTEGER NOT NULL CHECK (isDone IN (0,1))
        );
  ''');
      print(params.newValue);
      final sqlUpdate = database.prepare('''
      UPDATE todos 
      SET isDone = ?
      WHERE id = ?;
    ''');

      sqlUpdate..execute([params.newValue, params.id]);
    } catch (e) {
      print(e.toString());
    }
  }
}
