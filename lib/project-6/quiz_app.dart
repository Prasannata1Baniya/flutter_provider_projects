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
  List<QuestionsAnswers> questionsList = questions;
  List<bool> isClickedList = List.generate(questions.length, (index) => false);
  List<Color> widthColors = List.generate(questions.length, (index) => Colors.black);
  PageController pageController = PageController();
  int page = 0;

  void click(int index) {
    if (!isClickedList[index]) {
      setState(() {
        isClickedList[index] = true;
      });
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, widget) {
          return PageView.builder(
            controller: pageController,
            onPageChanged: (val) {
              setState(() {
                page = val;
              });
            },
            itemCount: questionsList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListView(
                children: [
                  // Question
                  Text(questionsList[index].question, style: const TextStyle(color: Colors.black)),
                  // Answer
                  for (int i = 0; i < questionsList[index].answer.length; i++)
                    GestureDetector(
                      onTap: () {
                        click(index);
                        // Check if the answer is correct and track it
                        String selectedAnswer = questionsList[index].answer.keys.elementAt(i);
                        quizProvider.trackRightAnswer(index, selectedAnswer);
                        if (questionsList[index].answer[selectedAnswer] == true) {
                          quizProvider.userScore();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: isClickedList[index] ? (questionsList[index].answer.values.elementAt(i) ? Colors.green : Colors.red) : Colors.black),
                        ),
                        child: Text(
                          questionsList[index].answer.keys.elementAt(i),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // You can add any additional logic here if needed
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: const Text("Submit", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Text("Total Score: ${quizProvider.score}"),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeIn);
        },
        child: const Icon(Icons.next_plan_outlined),
      ),
    );
  }
}

