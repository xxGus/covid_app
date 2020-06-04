import 'package:covid_app/shared_widgets/covidapp_container.dart';
import 'package:covid_app/ui/covid_risk/modal/high_risk.dart';
import 'package:covid_app/ui/covid_risk/modal/low_risk.dart';
import 'package:covid_app/ui/covid_risk/modal/medium_risk.dart';
import 'package:covid_app/ui/covid_risk/modal/modal_default.dart';
import 'package:covid_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int febre = 0;
  int dorDeCabeca = 0;
  int secrecao = 0;
  int dorGarganta = 0;
  int tosseSeca = 0;
  int difRespiratoria = 0;
  int doresCorpo = 0;
  int diarreia = 0;
  int viajou = 0;
  int contato = 0;
  int total = 0;

  TextStyle _textStyle = TextStyle(fontSize: 14);
  @override
  Widget build(BuildContext context) {
    return CovidAppContainer(
      child: Card(
        margin: EdgeInsets.zero,
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            CheckboxListTile(
              title: Text(
                "Tem febre?",
                style: _textStyle,
              ),
              value: febre != 0,
              onChanged: (v) {
                setState(() {
                  febre = v ? 5 : 0;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Tem dor de cabeça?",
                style: _textStyle,
              ),
              value: dorDeCabeca != 0,
              onChanged: (v) {
                setState(() {
                  dorDeCabeca = v ? 1 : 0;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Tem secreção nasal ou espirros?",
                style: _textStyle,
              ),
              value: secrecao != 0,
              onChanged: (v) {
                setState(() {
                  secrecao = v ? 1 : 0;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Tem dor/irritação de garganta?",
                style: _textStyle,
              ),
              value: dorGarganta != 0,
              onChanged: (v) {
                setState(() {
                  dorGarganta = v ? 1 : 0;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Tem tosse seca?",
                style: _textStyle,
              ),
              value: tosseSeca != 0,
              onChanged: (v) {
                setState(() {
                  tosseSeca = v ? 3 : 0;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Tem dificuldade respiratória?",
                style: _textStyle,
              ),
              value: difRespiratoria != 0,
              onChanged: (v) {
                setState(() {
                  difRespiratoria = v ? 10 : 0;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Tem dores no corpo?",
                style: _textStyle,
              ),
              value: doresCorpo != 0,
              onChanged: (v) {
                setState(() {
                  doresCorpo = v ? 1 : 0;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Tem diarreia?",
                style: _textStyle,
              ),
              value: diarreia != 0,
              onChanged: (v) {
                setState(() {
                  diarreia = v ? 1 : 0;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Viajou nos últimos 14 dias, para algum local com casos confirmados de COVID-19?",
                style: _textStyle,
              ),
              value: viajou != 0,
              onChanged: (v) {
                setState(() {
                  viajou = v ? 3 : 0;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Esteve em contato, nos últimos 14 dias, com um caso diagnosticado com COVID-19?",
                style: _textStyle,
              ),
              value: contato != 0,
              onChanged: (v) {
                setState(() {
                  contato = v ? 10 : 0;
                });
              },
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(),
              onPressed: () {
                total = febre +
                    dorDeCabeca +
                    secrecao +
                    dorGarganta +
                    tosseSeca +
                    difRespiratoria +
                    doresCorpo +
                    diarreia +
                    viajou +
                    contato;

                showDialog(
                    context: context,
                    builder: (_) {
                      if(total < 10){
                        return LowRisk();
                      } else if (total >= 10 && total < 20) {
                        return MediumRisk();
                      } else {
                        return HighRisk();
                      }
                    });
              },
              child: Text(
                "Concluir",
                style: TextStyle(
                  color: white,
                  fontSize: 16,
                ),
              ),
              color: accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
