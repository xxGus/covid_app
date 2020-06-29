import 'package:covid_app/utils/constants.dart';
import 'package:flutter/material.dart';

import './mask_item.dart';

class MaskScreen extends StatefulWidget {
  static const String routeName = '/mask';

  @override
  _MaskScreenState createState() => _MaskScreenState();
}

class _MaskScreenState extends State<MaskScreen> {
  List<Map<String, String>> images = [
    {'url': 'assets/images/1-step-mask.png'},
    {'url': 'assets/images/2-step-mask.png'},
    {'url': 'assets/images/3-step-mask.png'},
    {'url': 'assets/images/4-step-mask.png'},
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
          itemBuilder: (ctx, index) => MaskItem(
            urlImg: images[index]['url'],
          ),
        ),
      ),
    );
  }
}
