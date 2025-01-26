import 'package:flutter/material.dart';
import 'package:flutter_provider/project-3/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatelessWidget {
  TodoApp({super.key});
  final TextEditingController _textController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskProvider=Provider.of<TodoProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Todo App")),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Add a task',
                  ),
                )),
              IconButton(
                  onPressed: (){
                    if(_textController.text.isNotEmpty){
                      taskProvider.addTask(_textController.text);
                    }
                    _textController.clear();
                  },
                  icon: const Icon(Icons.add)),
              ],
            ),
          Expanded(child: ListView.builder(
            itemCount: taskProvider.tasks.length,
              itemBuilder: (context,index){
              final task=taskProvider.tasks[index];
            return ListTile(
             title: Text(task.title,style: TextStyle(
               decoration: task.isCompleted
                   ? TextDecoration.lineThrough
                   : null,
             ),),
              trailing: IconButton(
                  onPressed: (){
                    taskProvider.removeTask(task.id);
                  }, icon: const Icon(Icons.remove)
              ),
              onTap: (){
               taskProvider.taskCompletion(task.id);
              },
            );
          })
          ),
          ],
        ),
      ),
    );
  }
}
