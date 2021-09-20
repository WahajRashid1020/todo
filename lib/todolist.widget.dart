import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:todo/mytot.dart';
import 'package:todo/provider/todosprovider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = provider.todos;
    return todos.isEmpty
        ? Center(
            child: "List is empty".text.xl2.color(Colors.red).make(),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(12),
            separatorBuilder: (context, index) => Container(
              height: 1,
              color: Colors.teal,
            ),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
