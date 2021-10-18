import 'package:Dealerware2/Uploadvideo/showvideo.dart';
import 'package:Dealerware2/Uploadvideo/videoplayerchewie.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_mentor_quiz_app_tut/answer.dart';

import 'answers.dart';

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? Icon(
          Icons.check_circle,
          color: Colors.green,
        )
            : Icon(
          Icons.clear,
          color: Colors.red,
        ),
      );
      //when the quiz ends
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // what happens at the end of the quiz
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Questions',
          style: TextStyle(color: Colors.deepOrange),
        ),
        //centerTitle: true,

      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                if (_scoreTracker.length == 0)
                  SizedBox(
                    height: 25.0,
                  ),
                if (_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 130.0,
              margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
            as List<Map<String, Object>>)
                .map(
                  (answer) => Answer(
                answerText: answer['answerText'],
                answerColor: answerWasSelected
                    ? answer['score']
                    ? Colors.green
                    : Colors.red
                    : null,
                answerTap: () {
                  // if answer was already selected then nothing happens onTap
                  if (answerWasSelected) {
                    return;
                  }
                  //answer is being selected
                  _questionAnswered(answer['score']);
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
              onPressed: () {
                if (!answerWasSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Please select an answer before going to the next question'),
                  ));
                  return;
                }
                _nextQuestion();
              },
              child: Text(endOfQuiz ? 'Restart Quiz' : 'Next Question'),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '${_totalScore.toString()}/${_questions.length}',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            if (answerWasSelected && !endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: correctAnswerSelected ? Colors.green : Colors.red,
                child: Center(
                  child: Text(
                    correctAnswerSelected
                        ? 'Well done, you got it right!'
                        : 'Wrong :/',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text(
                    _totalScore > 4
                        ? 'Congratulations! Your final score is: $_totalScore'
                        : 'Your final score is: $_totalScore. Better luck next time!',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _totalScore > 4 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 10.0),
            Container(
              //width: 100.0,
              margin: EdgeInsets.symmetric(horizontal: 60.0),
              height: 50,
              child: ElevatedButton(
                child: Text('back'),
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.deepOrange)),
                onPressed: () {
                  print('Login Pressed');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyShowVideo()),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': 'Who is the founder of facebook?',
    'answers': [
      {'answerText': 'Mark Elliot Zuckerberg', 'score': true},
      {'answerText': 'Karyn Shambawamedza.', 'score': false},
      {'answerText': 'Bill Gates .', 'score': false},
    ],
  },
  {
    'question':
    'Who is the richest man in the world?',
    'answers': [
      {'answerText': 'Jeff Bezos', 'score': false},
      {'answerText': 'Adeleye Dangote', 'score': false},
      {'answerText': 'Elton Mask', 'score': true},
    ],
  },
  {
    'question': 'Who is the founder of Amazon?',
    'answers': [
      {'answerText': 'Britney Spears', 'score': false},
      {'answerText': 'Timbaland', 'score': false},
      {'answerText': 'Jeff Bezos', 'score': true},
    ],
  },
  {
    'question': 'In Georgia (the state), it’s illegal to eat what with a fork?',
    'answers': [
      {'answerText': 'Hamburgers', 'score': false},
      {'answerText': 'Fried chicken', 'score': true},
      {'answerText': 'Pizza', 'score': false},
    ],
  },
  {
    'question':
    'who is the worlds best soccer player?',
    'answers': [
      {'answerText': ' Lionel Messi', 'score': true},
      {'answerText': 'Kama Biliat', 'score': false},
      {'answerText': 'Cristiano Ronaldo', 'score': false},
    ],
  },
  {
    'question': 'fastest man in the world 2021?',
    'answers': [
      {'answerText': 'Trayvon Bromell', 'score': true},
      {'answerText': 'Ferdinand OMANYALA (duh)', 'score': false},
      {'answerText': 'Lamont Marcell JACOBS', 'score': false},
    ],
  },
  {
    'question': 'From which country do French fries originate?',
    'answers': [
      {'answerText': 'Belgium', 'score': true},
      {'answerText': 'France (duh)', 'score': false},
      {'answerText': 'Switzerland', 'score': false},
    ],
  },
  {
    'question': 'Which sea creature has three hearts?',
    'answers': [
      {'answerText': 'Great White Sharks', 'score': false},
      {'answerText': 'Killer Whales', 'score': false},
      {'answerText': 'The Octopus', 'score': true},
    ],
  },
  {
    'question': 'who is the worlds best tennis player?',
    'answers': [
      {'answerText': 'Daniil. Medvedev', 'score': false},
      {'answerText': 'Serena Williams', 'score': false},
      {'answerText': 'Novak. Djokovic', 'score': true},
    ],
  },
];
