import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/provider/dbprovider.dart';
import 'package:todoapp/provider/donetodoprovider.dart';
import 'package:todoapp/ui/registerpage.dart';
import 'package:todoapp/ui/todolistpage.dart';

import 'ui/donetodopage.dart';
import 'ui/loginpage.dart';
import 'ui/settingpage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  //final List<String> doneTodoList = const[];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>DoneTodoProvider()),
        ChangeNotifierProvider(create: (context)=>DbProvider()),
    ],
      child:
        MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            body: Center(
              child: const RegisterPage()),
            bottomNavigationBar: Builder(
              builder: (context){
                return BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
                      BottomNavigationBarItem(icon: Icon(Icons.done),label:'Done'),
                      BottomNavigationBarItem(icon: Icon(Icons.settings),label:'Settings'),
                    ],
                    currentIndex: 0,
                    onTap: (index)async{
                      switch(index) {
                        case 0: Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          //return ToDoListPage(doneTodoList: doneTodoList,);
                          return ToDoListPage();
                          }));
                          break;
                        case 1: Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return DoneToDoPage();
                          }));
                          break;
                        case 2: Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return SettingPage();
                          }));
                          break;
                      }
                    },
                );
              },
            )
          )
        ),
      );
  }
}

