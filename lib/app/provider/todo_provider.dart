import 'package:FLUTTERPROJECT/app/models/todomodels.dart';
import 'package:FLUTTERPROJECT/app/provider/database2_appwrite.dart';
import 'package:flutter/material.dart';


class TodoProvider extends ChangeNotifier {
  List<TodoModel> _todos = [];
  List<TodoModel> get todos =>
      _todos; //get todos make the copy of private list and make available to use

  void addTodo(TodoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(int index) {
    DatabaseHelper.instance.deleteTodo(_todos[index].id);
    _todos.removeAt(index);
    notifyListeners();
  }

  void updateTodo(int index, TodoModel todo) {
    _todos[index] = todo;
    DatabaseHelper.instance.updateTodo(todo);
    notifyListeners();
  }

  getTodo() async {
    _todos = await DatabaseHelper.instance.getTodos();
    notifyListeners();
  }
}