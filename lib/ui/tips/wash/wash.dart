import 'package:covid_app/ui/tips/wash/wash_item.dart';
import 'package:covid_app/utils/constants.dart';
import 'package:flutter/material.dart';

class WashScreen extends StatefulWidget {
  static const String routeName = '/wash';

  @override
  _WashScreenState createState() => _WashScreenState();
}

class _WashScreenState extends State<WashScreen> {
  List<Map<String, String>> images = [
    {
      'url': 'assets/images/1-step-wash.png',
      'text': 'Passe sabão e molhe com água'
    },
    {
      'url': 'assets/images/2-step-wash.png',
      'text': 'Esfregue a palma de cada mão'
    },
    {'url': 'assets/images/3-step-wash.png', 'text': 'Esfregue entre os dedos'},
    {'url': 'assets/images/4-step-wash.png', 'text': 'Esfregue os polegares'},
    {
      'url': 'assets/images/5-step-wash.png',
      'text': 'Lave o dorso de cada mão'
    },
    {'url': 'assets/images/6-step-wash.png', 'text': 'Lave os punhos'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        decoration: backgroundDefault(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15),
          itemCount: images.length,
          itemBuilder: (ctx, index) => WashItem(
            urlImg: images[index]['url'],
            text: images[index]['text'],
          ),
        ),
      ),
    );
  }
}
