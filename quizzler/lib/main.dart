import 'package:flutter/material.dart';
import 'package:quizzler/quize_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];



  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.questionBank[questionNumber].questionText,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                onPressed: () {
                  bool correctAnswer =quizBrain.questionBank[questionNumber].questionAnswer;

                  if (correctAnswer == true) {
                    print('user got right answer');
                  } else {
                    print('user got wrong answer');
                  }

                  setState(() {
                    questionNumber++;
                  });
                  print(questionNumber);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;

                  if (correctAnswer == false) {
                    print('user got right answer');
                  } else {
                    print('user got wrong answer');
                  }
                  setState(() {
                    questionNumber++;
                  });
                  print(questionNumber);
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ]);
  }
}

//13 question to be added
//Starting from Encapsulation- Video No-97