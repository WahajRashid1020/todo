import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todomodel.dart';
import 'package:todo/provider/todosprovider.dart';
import 'package:todo/todowidget.dart';

class EditTodo extends StatefulWidget {
  final Todo todo;

  const EditTodo({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoState createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit",
          style: TextStyle(color: Colors.teal, fontSize: 50),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Form(
          key: _formKey,
          child: MyWidget(
            title: title,
            description: description,
            onChangetiile: (title) => setState(() => this.title = title),
            onChangeDesc: (description) =>
                setState(() => this.description = description),
            onSavedTodo: saveTodo,
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodoProvider>(context, listen: false);
      provider.upadteTodo(widget.todo, title, description);
      Navigator.of(context).pop();
    }
  }
}
