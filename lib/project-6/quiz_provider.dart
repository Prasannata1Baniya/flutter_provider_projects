import 'package:flutter/material.dart';
import 'package:flutter_provider/project-6/questions_list.dart';

class QuizProvider extends ChangeNotifier {
  List<QuestionsAnswers> questionList = questions;
  final List<QuestionsAnswers> _rightAnswers = [];
  int _score = 0;

  List<QuestionsAnswers> get rightAnswers => _rightAnswers;
  int get score => _score;

  // Method to track the right answers based on user selections
  void trackRightAnswer(int questionIndex, String selectedAnswer) {
    if (questionList[questionIndex].answer[selectedAnswer] == true) {
      _rightAnswers.add(questionList[questionIndex]);
      notifyListeners();
    }
  }

  // Method to increment the score
  void userScore() {
    _score++;
    notifyListeners();
  }

  // Method to reset the quiz state
  void resetQuiz() {
    _rightAnswers.clear();
    _score = 0;
    notifyListeners();
  }
}

