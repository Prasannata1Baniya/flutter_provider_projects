
import 'package:flutter/material.dart';
import 'package:flutter_provider/projects_list.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectList projectList=ProjectList();
   List<dynamic> projects= projectList.getProject();
   List titleName=projectList.getName();
    List subtitleName=projectList.getSubTitle();

    return Scaffold(
      body: ListView.builder(
        itemCount: projects.length,
          itemBuilder: (context,index){
        return  GestureDetector(
          onTap: (){
           for (var element in projects) {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>element));
           }
          },
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: ListTile(
              title: Text(titleName[index]),
              subtitle: Text(subtitleName[index]),
            ),
          ),
        );
      }),
    );
  }
}
