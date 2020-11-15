import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore < 8) {
      resultText = 'You got a score of less than 8';
    } else if (resultScore < 16) {
      resultText = 'You got a score of less than 16.';
    } else {
      resultText = 'Wow. Highest score I have ever seen.';
    }
    return resultText;
  }
  

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text(resultPhrase, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
        FlatButton(child: Text('Restart Quiz!'), onPressed: resetHandler, textColor: Colors.blue,)
      ],
    ));
  }
  
}