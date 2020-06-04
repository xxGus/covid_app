import 'package:covid_app/ui/covid_risk/modal/modal_default.dart';
import 'package:flutter/material.dart';

class HighRisk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModalDefault(
      color: Colors.red[600],
      title: "Risco Alto",
      text: "Recomendamos que você procure profissionais da saúde para te ajudar.",
    );
  }
}