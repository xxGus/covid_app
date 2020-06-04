import 'package:covid_app/ui/covid_risk/modal/modal_default.dart';
import 'package:flutter/material.dart';

class LowRisk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModalDefault(
      color: Colors.green[700],
      title: "Risco Baixo",
      text: "Não precisa se preocupar, fique em em casa.",
    );
  }
}