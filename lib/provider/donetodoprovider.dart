

import 'package:flutter/foundation.dart';

class DoneTodoProvider extends ChangeNotifier{
  final List<String> _doneTodoList =  <String> [];
  List<String> get doneTodoList => _doneTodoList;
  void complete(String todo)
  {
    _doneTodoList.add(todo);
    notifyListeners();
  }
}