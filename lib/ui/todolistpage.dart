import 'package:cloud_firestore/cloud_firestore.dart';
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
  final List<String> _todoList = ['Selesaikan Flutter Pemula','Join GDSC ISTTS','Selesaikan project Flutter'];
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("To Do App"),
            actions: [
              const FlagIconWidget(),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.settings))
            ]
        ),
        body:
        Column(
          children: [
            Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _firestore.collection('todos').orderBy(
                      'dateCreated', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                        reverse: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 18.0
                        ),
                        children: snapshot.data!.docs.map((document) {
                          final data = document.data();
                          return ToDoTile(
                              task: data['task'],
                              isDone: false,
                              //data.doneTodoList.contains(_todoList[index]),//widget.doneTodoList.contains(_todoList[index]),
                              onClick: () {
                                //setState(() {
                                //widget.doneTodoList.add(_todoList[index]);
                                //data.complete(_todoList[index]);
                              }
                          );
                        }).toList());
                  },
                  //doneTasks: _doneTodoList,
                )

            ),
          ],
        )
    );
  }
}
