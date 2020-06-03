import 'package:covid_app/shared_widgets/app_widgets.dart';
import 'package:covid_app/ui/covid_risk/quiz.dart';
import 'package:flutter/material.dart';

class CovidRiskScreen extends StatefulWidget {
  @override
  _CovidRiskScreenState createState() => _CovidRiskScreenState();
}

class _CovidRiskScreenState extends State<CovidRiskScreen> {
  @override
  Widget build(BuildContext context) {
   return SizedBox.expand(
      child: Stack(
        children: <Widget>[
          AppWidget(
            image: "assets/images/semfundo-quiz.png",
            tagline: 'Avaliação',
            imageTop: 45,
          ),
          Align(
            alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
              child: Quiz(),
            ),
          )
        ],
      ),
    );
  }
}