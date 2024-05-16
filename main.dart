
import 'package:demo/todolist.dart';

import 'package:flutter/material.dart';




void main(){

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return /* Get*/MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'first',
      routes: {

      },
      title: 'Flutter Demo',
    

home: TodoList(),



    
    );
  }
}


