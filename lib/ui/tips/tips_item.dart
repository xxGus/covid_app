import 'package:flutter/material.dart';

class TipsItem extends StatelessWidget {
  String text;
  Function onTap;
  TipsItem({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(text),
      trailing: Icon(Icons.navigate_next),
    );
  }
}
