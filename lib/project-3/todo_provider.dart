

import 'package:flutter/material.dart';

import 'task_model.dart';

class TodoProvider extends ChangeNotifier{
     final  List<Task> _tasks=[];

      List<Task> get tasks=>_tasks;

      //adding note
void addTask(String title){
  final newTask=Task(id: DateTime.now().toString(), title: title );
  _tasks.add(newTask);
  notifyListeners();
}

//removing
void removeTask(String id){
  _tasks.removeWhere((task) => task.id==id);
  notifyListeners();
}

void taskCompletion(String id){
  final task =_tasks.firstWhere((task) => task.id==id);
  task.isCompleted=!task.isCompleted;
  notifyListeners();
}
}


/*
void removeWhere(bool Function(Task) test)  Containing class: List  Type: void Function(bool Function(Task))
Removes all objects from this list that satisfy test.
An object o satisfies test if test(o) is true.
final numbers = <String><code>'one', 'two', 'three', 'four'</code>;
numbers.removeWhere((item) => item.length == 3);
print(numbers); // <code>three, four</code>
The list must be growable.
 */