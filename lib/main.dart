import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(
  const MyApp(),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Which food tastes the best',
      'answers': [
        {'text': 'Burger', 'score': 10},
        {'text': 'Pizza', 'score': 0},
        {'text': 'HotDog', 'score': 0},
        {'text': 'CornDog', 'score': 0},
      ],
    },
    {
      'questionText': 'Cereal First or Milk First?',
      'answers': [
        {'text': 'Cereal', 'score': 0},
        {'text': 'Milk', 'score': 0},
        {'text': 'Water', 'score': 0},
        {'text': 'Bowl', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}