
import 'package:flutter_provider/project-1/counter_app.dart';
import 'package:flutter_provider/project-2/catalog_page.dart';
import 'package:flutter_provider/project-3/todo_app.dart';
import 'package:flutter_provider/project-4/stop_watch.dart';
import 'package:flutter_provider/project-5/counter_with_history.dart';
import 'package:flutter_provider/project-6/quiz_app.dart';

class ProjectList{

  List getName(){
    List<String> title=[
      'Project one',
      'Project Two',
      'Project Three',
      'Project four',
      'Project five',
      'Project six'
    ];
    return title;
}

  List getSubTitle(){
    List<String> projectList=[
      'Counter App',
      'Shopping Cart',
      'Todo App',
      'Stop Watch',
      'Counter App With History',
      'Quiz App',
    ];
    return projectList;
  }

  List getProject(){
    List projectList=[
     const CounterApp(),
      const CatalogPage(),
      TodoApp(),
      const StopwatchScreen(),
      const CounterAppWithHistory(),
      const QuizApp(),
    ];
    return projectList;
  }
}