import 'package:flutter/material.dart';

import 'questions.dart';
//import 'package:flutter_mentor_quiz_app_tut/home.dart';

void main() {
  runApp(MyQuiz());
}

class MyQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz  App',
      theme: ThemeData(
        primaryColor: Color(0xFF55C1EF),
      ),

      home: Question(),
    );
  }
}
