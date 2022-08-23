import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String email;
  String name;
  final Function resetHandler;
  Result(
    this.resetHandler,
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Please enter details to complete appointment',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Name',
                      ),
                      validator: (String value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        name = value;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Email',
                      ),
                      validator: (String value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        email = value;
                      },
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 100),
                        child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                StadiumBorder()),
                            side: MaterialStateProperty.resolveWith<BorderSide>(
                                (Set<MaterialState> states) {
                              final Color color =
                                  states.contains(MaterialState.pressed)
                                      ? Colors.blue
                                      : Colors.red;
                              return BorderSide(color: color, width: 2);
                            }),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // widget.resetHandler
                              _formKey.currentState.save();
                              print(email);
                              print(name);
                              resetHandler(name, email);
                            }
                          },
                          child: Text('Book Appointment'),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
