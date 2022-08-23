import 'package:flutter/material.dart';
import 'form.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What consultation are you looking for?',
      'answers': ['Heart ', 'Brain', 'Gastro', 'Other'],
    },
    {
      'questionText': 'What\'s your Gender?',
      'answers': ['Male', 'Female', 'Other'],
    },
    {
      'questionText': 'Plese Select Time Slot',
      'answers': ['10-11 AM', '01-02 PM', '03-04 PM', '05-06 PM'],
    },
  ];

  var _questionIndex = 0;
  var data = [];
  void _answerQuestion(option) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    data.add(option);
    print(data);
  }

  void _bookAppointment(name, email) {
    setState(() {
      _questionIndex = 0;
    });
    data.add(name);
    data.add(email);
    print(data);
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Patient App'),
        ),
        body: _questionIndex < _questions.length
            ? PatientForm(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_bookAppointment),
      ),
    );
  }
}
