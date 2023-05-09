import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/donetodoprovider.dart';
import '../widgets/todotilewidget.dart';

class DoneToDoPage extends StatefulWidget {
  //final List<String> doneTodoList;
  //const DoneToDoPage({Key? key,required this.doneTodoList}) : super(key: key);
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
        body: Consumer<DoneTodoProvider>(
              builder: (context,DoneTodoProvider data,widget)
          { return ListView.builder(
            itemCount: data.doneTodoList.length ,
            itemBuilder: (context,index) {
              return ListTile(
                title: Text(data.doneTodoList[index]),
              );
            }
        );
          }
    ));
  }
}
