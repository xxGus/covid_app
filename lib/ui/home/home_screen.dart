import 'package:covid_app/shared_widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: <Widget>[
          AppWidget(
            image: "assets/images/main.png",
            tagline: 'Status\nCOVID-19',
            imageTop: 120,
          ),
          Align(
            alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
              child: HomeBody(),
            ),
          )
        ],
      ),
    );
  }
}
