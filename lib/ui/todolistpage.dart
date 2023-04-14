import 'package:flutter/material.dart';
import 'package:todoapp/widgets/flagiconwidget.dart';

class ToDoListPage extends StatelessWidget {
  static const routeName='/todolist_page';
  const ToDoListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
        actions: [
          const FlagIconWidget(),
          IconButton(onPressed: (){

          }, icon: Icon(Icons.settings))
        ]
      ),
    );
  }
}
