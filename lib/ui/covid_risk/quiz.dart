import 'package:covid_app/shared_widgets/covidapp_container.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return CovidAppContainer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 500,
            width: double.infinity,
                  child: Card(
                    color: Colors.yellow[100],
              child: Text("TEst"),
            ),
          ),
        ],
      ),
    );
  }
}