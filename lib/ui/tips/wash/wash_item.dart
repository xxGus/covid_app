import 'package:flutter/material.dart';

class WashItem extends StatelessWidget {
  String urlImg;
  String text;
  WashItem({this.urlImg, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Card(
          color: Color.fromRGBO(254, 248, 248, 1),
          margin: EdgeInsets.symmetric(horizontal: 10),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                urlImg,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
