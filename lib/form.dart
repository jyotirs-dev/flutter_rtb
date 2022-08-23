import 'package:flutter/material.dart';

import 'questions.dart';
import 'options.dart';

class PatientForm extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  PatientForm({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Options(() => answerQuestion(answer), answer);
        }).toList()
      ],
    );
  }
}
