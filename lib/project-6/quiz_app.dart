import 'package:flutter/material.dart';
import 'package:flutter_provider/project-6/questions_list.dart';
import 'package:flutter_provider/project-6/quiz_provider.dart';
import 'package:provider/provider.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {


  List<QuestionsAnswers> questionsList=questions;
  bool isClicked= false;
  Color widthColor=Colors.black;
  PageController pageController=PageController();
  int page=0;

  void click(int index){
    setState(() {
      isClicked=!isClicked;
    });
    if(!isClicked){
      if(questionsList[index].answer.values.contains(true)) {
        setState(() {
          isClicked=!isClicked;
          widthColor=Colors.green;
        });
      }else{
        setState(() {
          widthColor=Colors.red;
        });
      }
    }
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App",style: TextStyle(color:Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:Consumer<QuizProvider>(
            builder:(context,value,widget){
              final quizProvider= Provider.of<QuizProvider>(context);
              return PageView.builder(
                controller: pageController,
            onPageChanged: (val){
                  setState(() {
                    page=val;
                  });
            },
            itemCount: questionsList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListView(
                children: [

                  //Question
                  Text(questionsList[index].question),

                  //Answer
                  for(int i=0;i<questionsList[index].answer.length;i++)
                    GestureDetector(
                      onTap: ()=>click(index),
                      child: Container(
                          decoration: BoxDecoration(
                            border:Border.all(
                              color: widthColor,
                            ),
                          ),
                          child: Text(questionsList[index].answer.keys.elementAt(i),
                            style: const  TextStyle(color:Colors.white,
                            ),
                          )
                      ),
                    ),

                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap:(){
                      quizProvider.trackRightAnswer();
                      quizProvider.userScore();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: const Text("Submit",style: TextStyle(color:Colors.white),),
                    ),
                  ),
                  Text("Total Score:${context.watch<QuizProvider>().scores}"),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        pageController.nextPage(duration:const  Duration(seconds: 1),
            curve: Curves.easeIn);
      },
      child: const Icon(Icons.next_plan_outlined),
      ),
    );
  }
}
