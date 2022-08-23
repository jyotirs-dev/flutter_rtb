import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Options(this.selectHandler, this.answerText);
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.yellow[200],
    primary: Colors.blue[800],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        style: raisedButtonStyle,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
