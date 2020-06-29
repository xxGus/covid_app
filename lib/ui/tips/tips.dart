import 'package:covid_app/routes/routes.dart';
import 'package:covid_app/shared_widgets/app_widgets.dart';
import 'package:covid_app/shared_widgets/covidapp_container.dart';
import 'package:covid_app/ui/tips/tips_item.dart';
import 'package:flutter/material.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: <Widget>[
          AppWidget(
            image: "assets/images/semfundo-quiz.png",
            tagline: 'Dicas',
            imageTop: 45,
          ),
          CovidAppContainer(
            child: Center(
              child: ListView(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  TipsItem(
                    text: 'Lavar as mãos',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.wash,
                      );
                    },
                  ),
                  TipsItem(
                    text: 'Usar máscara',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.mask,
                      );
                    },
                  ),
                  TipsItem(
                    text: 'Distanciamento',
                    onTap: () {},
                  ),
                  TipsItem(
                    text: 'Álcool em gel',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
