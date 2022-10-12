import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  // ignore: prefer_const_constructors_in_immutables
  Result(this.resultScore, this.resetHandler, {super.key});

  String get resultPhrase {
    String resultText;
    if (resultScore == 20) {
      resultText = 'We should be friend!';
    } else if (resultScore == 10) {
      resultText = 'Getting there try again!';
    } else {
      resultText = 'get help';
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
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text("Your total score is $resultScore"),
          TextButton(
            onPressed: (() => resetHandler()),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            child: Text(
              'Restart Quiz!',
            ),
          )
        ],
      ),
    );
  }
}