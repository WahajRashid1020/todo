import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todomodel.dart';
import 'package:todo/provider/todosprovider.dart';
import 'package:todo/todowidget.dart';

class AddToDO extends StatefulWidget {
  @override
  _AddToDOState createState() => _AddToDOState();
}

class _AddToDOState extends State<AddToDO> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true), // passing true
            child: Text('X'),
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                textStyle:
                    TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Todo"),
              MyWidget(
                onChangetiile: (title) => setState(() => this.title = title),
                onChangeDesc: (description) =>
                    setState(() => this.description = description),
                onSavedTodo: addTodo,
                description: '',
                title: '',
              )
            ],
          ),
        ),
      );
  void addTodo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final todo = Todo(
          title: title,
          id: DateTime.now().toString(),
          description: description,
          createdTime: DateTime.now());

      final provider = Provider.of<TodoProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
