import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/donetodoprovider.dart';
import 'package:todoapp/widgets/flagiconwidget.dart';

import '../model/todo.dart';
import '../provider/dbprovider.dart';
import '../widgets/todotilewidget.dart';

class ToDoAddUpdatePage extends StatefulWidget {
  static const routeName='/todoaddupdate_page';
  final Todo? todo;
  const ToDoAddUpdatePage({Key? key,this.todo}) : super(key: key);

  @override
  State<ToDoAddUpdatePage> createState() => _ToDoAddUpdatePageState();
}
class _ToDoAddUpdatePageState extends State<ToDoAddUpdatePage> {
  var _taskController = TextEditingController();
  bool _isUpdate = false;
  late User? _activeUser;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      _activeUser = _auth.currentUser;

    }
    catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    if (widget.todo!=null) {
      _taskController.text = widget.todo!.task;
      _isUpdate=true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Task'),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Save"),
                onPressed: () async {
                  if (!_isUpdate) {
                    //insert data baru ke Firestore
                    _firestore.collection('todos').add({
                      'task': _taskController.text,
                      'owner': _activeUser?.email,
                      'dateCreated': Timestamp.now(),
                    }
                    );
                    //insert data baru ke Database Lokal
                    Provider.of<DbProvider>(context,listen:false).addTodo(
                      Todo(
                        task: _taskController.text,
                        dateCreated: Timestamp.now().toString(),
                      )
                    );
                    _taskController.clear();
                  }
                },
              )
            )
          ],
        )
      )
    );
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }
}
