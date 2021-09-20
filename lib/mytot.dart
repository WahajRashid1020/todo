import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/edittodo.dart';
import 'package:todo/model/todomodel.dart';
import 'package:todo/provider/todosprovider.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key? key, required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        child: buildTodo(context),
        actions: [
          IconSlideAction(
            color: Colors.green,
            onTap: () => editTodo(context, todo),
            caption: "Edit",
            icon: Icons.edit,
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            onTap: () {
              deltodo(context, todo);
            },
            caption: "Delete",
            icon: Icons.delete,
          )
        ],
      );
  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Checkbox(
                    value: todo.isDone,
                    onChanged: (_) {
                      final provider =
                          Provider.of<TodoProvider>(context, listen: false);
                      final isDone = provider.toggleTodoStatus(todo);
                    }),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                    child: Column(
                  children: [
                    todo.title.text.color(Colors.teal).xl3.make(),
                    todo.description.text.color(Colors.teal).xl.make()
                  ],
                ))
              ],
            ),
          ),
        ),
      );
  void deltodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodoProvider>(context, listen: false);
    provider.removeTodo(todo);
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => EditTodo(todo: todo)));
}
