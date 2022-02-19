import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './result.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  final questions = const [
    {
      "questionText": "What's your favorite color?",
      "answer": [
        {"text": "Black", "score": 4},
        {"text": "Red", "score": 3},
        {"text": "Green", "score": 2},
        {"text": "White", "score": 1}
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answer": [
        {"text": "Rabbit", "score": 4},
        {"text": "Snake", "score": 3},
        {"text": "Elephant", "score": 2},
        {"text": "Lion", "score": 1}
      ],
    },
    {
      "questionText": "What's your favorite programming language",
      "answer": [
        {"text": "Dart", "score": 9},
        {"text": "Python", "score": 7},
        {"text": "JavaScript", "score": 5},
        {"text": "Java", "score": 3}
      ],
    },
  ];

  // MyApp({Key? key}) : super(key: key);
  var totalScore = 0;

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      if (questionIndex < questions.length) {
        questionIndex += 1;
      }
    });
    print("Answer Choosen");
    print(questionIndex);
  }

  void getBack() {
    setState(() {
      totalScore = 0;
      questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        body: questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[questionIndex]["questionText"],
                  ),
                  ...(questions[questionIndex]["answer"] as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(() => answerQuestion(int.parse(answer["score"].toString())), answer["text"].toString());
                  }).toList()
                  // Answer(answerQuestion),
                  // Answer(answerQuestion),
                  // Answer(answerQuestion),
                ],
              )
            : Result(totalScore, getBack)
      ),
    );
  }
}
