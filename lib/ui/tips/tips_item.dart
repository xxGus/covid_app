import 'package:flutter/material.dart';

class TipsItem extends StatelessWidget {
  String text;
  String urlImg;
  Function onTap;
  TipsItem({this.text, this.urlImg, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: 300,
          height: 300,
          child: Card(
            semanticContainer: false,
            color: Color.fromRGBO(254, 248, 248, 1),
            margin: EdgeInsets.symmetric(
              horizontal: 0,
            ),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    urlImg,
                    width: double.infinity,
                    height: 300,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
