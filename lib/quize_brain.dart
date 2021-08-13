import 'package:quizzler_app/question.dart';

class QuizeBrain{
  int _questionNumber = 0;
  List <Questions> _questionBank = [
    Questions(q: "IS your name is Momin ?", a: false),
    Questions(q: "Do you have a car ?", a: true),
    Questions(q: "Do you have a bike", a: true)
  ];

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer(){
    return _questionBank[_questionNumber].questionAnswers;
  }

  void nextQuestion()
  {
    if(_questionNumber < _questionBank.length ){
      _questionNumber++;
    }
  }

}