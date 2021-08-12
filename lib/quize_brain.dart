import 'package:quizzler_app/question.dart';

class QuizeBrain{
  List <Questions> _questionBank = [
    Questions(q: "IS your name is Momin ?", a: false),
    Questions(q: "Do you have a car ?", a: true),
    Questions(q: "Do you have a bike", a: true)
  ];

  String getQuestionText(int questionNumber){
    return _questionBank[questionNumber].questionText;
  }

  bool getCorrectAnswer(int questionNumber){
    return _questionBank[questionNumber].questionAnswers;
  }


}