import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color ?",
      "answers": [
        {"text": "Black", "score": 15},
        {"text": "White", "score": 10},
        {"text": "Yellow", "score": 5},
        {"text": "Blue", "score": 3},
        {"text": "Red", "score": 1},
      ]
    },
    {
      "questionText": "What's your favorite tech frontEnd ?",
      "answers": [
        {"text": "ReactJs", "score": 5},
        {"text": "VueJs", "score": 3},
        {"text": "AlpineJs", "score": 1},
        {"text": "Svelte", "score": 10},
        {"text": "RedwoodJS", "score": 5},
      ]
    },
    {
      "questionText": "Who is your prefer anime ?",
      "answers": [
        {"text": "Naruto SAGA", "score": 5},
        {"text": "DB SAGA", "score": 5},
        {"text": "Bleach", "score": 5},
        {"text": "One piece", "score": 5},
        {"text": "SNK", "score": 5},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
      print(_questionIndex);
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }
   void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Okok is good'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion:  _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
