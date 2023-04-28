import 'package:flutter/material.dart';

class DoneToDoPage extends StatefulWidget {
  const DoneToDoPage({Key? key}) : super(key: key);

  @override
  State<DoneToDoPage> createState() => _DoneToDoPageState();
}

class _DoneToDoPageState extends State<DoneToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Done To Do App"),
        ),
        body:  ListView()
    );
  }
}
