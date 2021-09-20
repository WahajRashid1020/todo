import 'package:flutter/cupertino.dart';
import 'package:todo/model/todomodel.dart';

class TodoProvider extends ChangeNotifier {
  static List<Todo> _todos = [
    Todo(
      description: "Description Here",
      title: "Title Here",
      createdTime: DateTime.now(),
      id: '1',
    ),
    Todo(
      description: "Description Here",
      title: "Title Here",
      createdTime: DateTime.now(),
      id: '1',
    ),
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();
  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void upadteTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }
}
