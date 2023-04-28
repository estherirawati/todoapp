import 'package:flutter/material.dart';
import 'package:todoapp/widgets/flagiconwidget.dart';

import '../widgets/todotilewidget.dart';

class ToDoListPage extends StatefulWidget {
  static const routeName='/todolist_page';

  const ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final List<String> _todoList = const['Selesaikan Flutter Pemula','Join GDSC ISTTS'];
  final List<String> _doneTodoList = const[];

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
      body:  ListView.builder(
          itemCount: _todoList.length ,
          itemBuilder: (context,index) {
            return ToDoTile(
                task: _todoList[index],
                isDone: _doneTodoList.contains(_todoList[index]),
                onClick: () {
                  setState(() {
                    _doneTodoList.add(_todoList[index]);
                  });
                },
                //doneTasks: _doneTodoList,
            );
          }
      )
    );
  }
}
