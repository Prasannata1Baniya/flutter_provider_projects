

import 'package:flutter/material.dart';
import 'package:flutter_provider/project-6/questions_list.dart';

class QuizProvider extends ChangeNotifier{

  List<QuestionsAnswers> questionList= questions;
  List<dynamic> _rightAnswer=[];
  int scores=0;

  List<dynamic> get rightAnswer=>_rightAnswer;

  void trackRightAnswer(){

      List<dynamic> rightAnswer = questionList.where((element) {
        var el = element.answer.containsValue(true);
        return el;
      }).toList();
      _rightAnswer = rightAnswer;
      notifyListeners();
  }

  void userScore(){
    scores=_rightAnswer.length++;
    notifyListeners();
  }
}