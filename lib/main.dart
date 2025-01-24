import 'package:flutter/material.dart';
import 'package:flutter_provider/projects_access.dart';
import 'package:provider/provider.dart';
import 'project-1/counter_provider.dart';
import 'project-2/cart_provider.dart';
import 'project-3/todo_provider.dart';
import 'project-4/stop_watch_provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
    ChangeNotifierProvider(create: (_)=>CounterProvider()),
     ChangeNotifierProvider(create: (_)=>CartProvider()),
      ChangeNotifierProvider(create: (_)=>TodoProvider()),
       ChangeNotifierProvider(create: (_)=>StopwatchProvider()),
     ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Flutter Demo',
      home:  ProjectsPage(),
      /*ChangeNotifierProvider(
          create: (_)=>CounterProvider(),
        child: const MyHomePage(),
      ),*/
    );
  }
}
