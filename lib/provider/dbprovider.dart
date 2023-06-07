import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../utils/databasehelper.dart';

class DbProvider extends ChangeNotifier{
  List<Todo> _arrToDo = [];
  late DatabaseHelper _dbHelper;
  List<Todo> get todos=> _arrToDo;
  DbProvider() {
    _dbHelper = DatabaseHelper();
  }
  Future<void> addTodo(Todo todo) async{
    await _dbHelper.insertTodo(todo);
  }
}