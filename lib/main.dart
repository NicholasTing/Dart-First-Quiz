import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'What\'s your favourite colour?',
        'answers': [{'text':'Black', 'score':10}, {'text':'Red', 'score': 5}, {'text':'Green', 'score': 3}, {'text':'White', 'score': 1}]
      },
      {
        'questionText': 'What\'s your favourite animal?',
          'answers': [{'text':'Cat', 'score':10}, {'text':'Dog', 'score': 5}, {'text':'Monkey', 'score': 3}, {'text':'Gorilla', 'score': 1}]

      },
      {
        'questionText': 'What\'s your favourite brand?',
          'answers': [{'text':'Apple', 'score':10}, {'text':'Google', 'score': 5}, {'text':'Samsung', 'score': 3}, {'text':'Oppo', 'score': 1}]

      }
    ];

    void _answerQuestion(int score) {
      _totalScore += score;
      if (_questionIndex < _questions.length) {
        setState(() {
          _questionIndex++;
        });
        print(_questionIndex);
      }
    }

    void _resetQuiz() {
      setState(() {
        _questionIndex = 0;
        _totalScore = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Nicholas App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion)
              : Result(_totalScore, _resetQuiz)
    ));
  }
}
