
class QuestionsAnswers{
  final String question;
  late final Map<String,bool> answer;
  QuestionsAnswers({required this.question,required this.answer});

}

  List<QuestionsAnswers> questions = [
    QuestionsAnswers(
      question: 'What is Dart?',
      answer: {
        'A programming language used for building mobile apps': true,
        'A database management system': false,
        'A text editor for writing code': false,
        'A game engine': false,
      },
    ),

    QuestionsAnswers(
      question: 'Which of the following is the correct way to declare a variable in Dart?',
      answer: {
        'var x = 5;': true,
        'x := 5;': false,
        'let x = 5;': false,
        'dim x = 5;': false,
      },
    ),

    QuestionsAnswers(
      question: 'What is the main function signature in Dart?',
      answer: {
        'void main() {}': true,
        'main() {}': false,
        'int main() {}': false,
        'Future main() {}': false,
      },
    ),

    QuestionsAnswers(
      question: 'Which of the following is not a valid Dart data type?',
      answer: {
        'int': false,
        'float': true,
        'bool': false,
        'String': false,
      },
    ),

    QuestionsAnswers(
      question: 'How do you create a list in Dart?',
      answer: {
        'var list = [];': true,
        'var list = ();': false,
        'list = []': false,
        'var list = List[];': false,
      },
    ),

    QuestionsAnswers(
      question: 'Which method is used to add an element to a list in Dart?',
      answer: {
        'add()': true,
        'insert()': false,
        'append()': false,
        'push()': false,
      },
    ),

    QuestionsAnswers(
      question: 'Which operator is used for string interpolation in Dart?',
      answer: {
        '\$': true,
        '@': false,
        '&': false,
        '#': false,
      },
    ),

    QuestionsAnswers(
      question: 'What will be the output of the following code in Dart?',
      answer: {
        'print(5 + 3) == 8': true,
        'print(5 + 3) == 53': false,
        'print(5 + 3) == 53.0': false,
        'print(5 + 3) == "53"': false,
      },
    ),

  ];

