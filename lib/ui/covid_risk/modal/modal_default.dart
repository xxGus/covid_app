import 'package:covid_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ModalDefault extends StatelessWidget {
  final String title;
  final String text;
  final Color color;

  ModalDefault({
    this.title,
    this.text,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 200,
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                      color: white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
