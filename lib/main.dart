import 'package:flutter/material.dart';
import 'package:quizzler_app/quize_brain.dart';


void main() {
  runApp(Quizzler());
}

class Quizzler extends StatefulWidget {
  Quizzler({Key? key}) : super(key: key);

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  QuizeBrain quizebrain = QuizeBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userpickanswer) {
    setState(() {
      if (quizebrain.isFinished() == true) {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) =>AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
            TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
      child: const Text('OK'),
            ),],),);
        quizebrain.reSet();
        scoreKeeper = [];
      }


      else {
        bool correctanswers = quizebrain.getCorrectAnswer();
        if (userpickanswer == correctanswers) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.blue,
            ),
          );
        } else {
          scoreKeeper.add(Icon(
            Icons.clear,
            color: Colors.red,
          ));
        }

        quizebrain.nextQuestion();
      }
    }
    );
      }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    quizebrain.getQuestionText(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Text("True"),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text("False"),
                ),
              ),
              Row(children: scoreKeeper)
            ],
          ),
        ),
      ),
    );
  }
}



