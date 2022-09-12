import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!, your score is $resultScore';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!, your score is $resultScore';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!, your score is $resultScore';
    } else {
      resultText = 'You are so bad!, your score is $resultScore';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart Quiz!',
            ),
            style: TextButton.styleFrom(primary: Colors.blue),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
