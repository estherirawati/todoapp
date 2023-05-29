import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/donetodoprovider.dart';
import 'package:todoapp/widgets/flagiconwidget.dart';

import '../model/todo.dart';
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

  @override
  void initState() {
    super.initState();
    if (widget.)
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
