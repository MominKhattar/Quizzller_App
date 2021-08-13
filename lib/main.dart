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

  // List <String> questions= [
  //   "IS your name is Momin ?",
  //   "Do you have a car ?",
  //   "Do you have a bike",
  // ];

  // List <bool> answers = [
  //   false,
  //   true,true
  // ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                  bool correctanswers =
                      quizebrain.getCorrectAnswer();
                  if (correctanswers == true) {
                    print("Your answer is right");
                  } else {
                    print("Your answer is wronge");
                  }

                  setState(() {
                    quizebrain.nextQuestion();
                  });
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
                  bool correctanswers =
                      quizebrain.getCorrectAnswer();
                  if (correctanswers == false) {
                    print("Your answer is right");
                  } else {
                    print("Your answer is wronge");
                  }

                  setState(() {
                    quizebrain.nextQuestion();
                  });
                },
                child: Text("False"),
              ),
            ),
            Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                Icon(
                  Icons.close,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
