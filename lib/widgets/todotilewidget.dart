import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String task;
  final bool isDone;
  final Function() onClick;
  const ToDoTile({Key? key,
    required this.task, required this.isDone,
    required this.onClick
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task),
      trailing: isDone?
          const Icon(Icons.done):
          ElevatedButton(
              onPressed: onClick,
              child: const Text('Done'))
      );
  }
}
