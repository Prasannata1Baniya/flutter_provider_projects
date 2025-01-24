
import 'package:flutter_provider/project-1/counter_app.dart';
import 'package:flutter_provider/project-2/catalog_page.dart';
import 'package:flutter_provider/project-3/todo_app.dart';

class ProjectList{
 // final void Function()? onTap;
 //ProjectList({required this.onTap});

  List getName(){
    List<String> title=[
      'Project one',
      'Project Two',
      'Project Three',
      'Project four',
    ];
    return title;
}

  List getSubTitle(){
    List<String> projectList=[
      'Counter aApp',
      'Shopping Cart',
      'Todo App',
      'Stop Watch'
    ];
    return projectList;
  }

  List getProject(){
    List projectList=[
     const CounterApp(),
      const CatalogPage(),
      TodoApp(),
      Stopwatch(),
    ];
    return projectList;
  }
}