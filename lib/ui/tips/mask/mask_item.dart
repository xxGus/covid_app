import 'package:flutter/material.dart';

class MaskItem extends StatelessWidget {
  String urlImg;
  MaskItem({this.urlImg,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 275,
        child: Card(
          color: Color.fromRGBO(254, 248, 248, 1),
          margin: EdgeInsets.symmetric(horizontal: 10),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                urlImg,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
