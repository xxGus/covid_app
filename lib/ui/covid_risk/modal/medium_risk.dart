import 'package:covid_app/ui/covid_risk/modal/modal_default.dart';
import 'package:flutter/material.dart';

class MediumRisk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModalDefault(
      color: Colors.yellow[600],
      title: "Risco Médio",
      text: "Continue seguindo as recomendações dos profissionais da saúde.",
    );
  }
}