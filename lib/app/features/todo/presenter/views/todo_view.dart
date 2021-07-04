import 'package:clean_arch/app/features/todo/domain/useCases/change_todo_usecase.dart';
import 'package:clean_arch/app/features/todo/presenter/controller/todo_controller.dart';
import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  late TodoController todoController;

  @override
  void initState() {
    todoController = TodoController();
    todoController.loadTodo();
    super.initState();
  }

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await todoController.createTodo(name: 'Todo', isDone: 0);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: AnimatedBuilder(
            animation: todoController,
            builder: (context, _) {
              return ListView.builder(
                  itemCount: todoController.todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todoController.todos[index].name),
                      leading: Checkbox(
                          onChanged: (bool? value) {
                            if (value != null) {
                              todoController.updateTodo(
                                ChangeTodoUsecaseDTO(
                                    id: todoController.todos[index].id!,
                                    newValue: value == true ? 1 : 0),
                              );
                            }
                          },
                          value: todoController.todos[index].isDone == 1),
                    );
                  });
            }),
      ),
    );
  }
}
