import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/donetodoprovider.dart';
import 'package:todoapp/widgets/flagiconwidget.dart';

import '../widgets/todotilewidget.dart';

class ToDoListPage extends StatefulWidget {
  static const routeName='/todolist_page';
  //final List<String> doneTodoList;
  //const ToDoListPage({Key? key,required this.doneTodoList}) : super(key: key);
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final List<String> _todoList = const['Selesaikan Flutter Pemula','Join GDSC ISTTS'];

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
            return Consumer<DoneTodoProvider>(
              builder: (context,DoneTodoProvider data,widget)
                {
                    return ToDoTile(
                        task: _todoList[index],
                        isDone: data.doneTodoList.contains(_todoList[index]),//widget.doneTodoList.contains(_todoList[index]),
                        onClick: () {
                          //setState(() {
                            //widget.doneTodoList.add(_todoList[index]);
                            data.complete(_todoList[index]);
                          }
                          );
                        },
                        //doneTasks: _doneTodoList,
                    );
                }
            )

      );
  }
}
