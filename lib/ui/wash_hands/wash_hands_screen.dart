import 'package:flutter/material.dart';
import 'ImgWashHands.dart';

class WashHandsScreen extends StatefulWidget {
  @override
  _WashHandsScreenState createState() => _WashHandsScreenState();
}

class _WashHandsScreenState extends State<WashHandsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         Center(
      child: Card(child: _body()),
    ));
  }

  _body() {
    List<ImgWashHands> imgwhashhands = [
      ImgWashHands("Ativo1.png"),
      ImgWashHands("Ativo2.png"),
      ImgWashHands("Ativo3.png"),
      ImgWashHands("Ativo4.png"),
      ImgWashHands("Ativo5.png"),
      ImgWashHands("Ativo6.png")
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imgwhashhands.length,
      itemExtent: 300,
      itemBuilder: (BuildContext context, int index) {
        ImgWashHands WashHandsSteps = imgwhashhands[index];
        return _imagem(WashHandsSteps.imagem);
      },
    );
  }

  _imagem(String img) {
    return Container(
      width: 120,
      height: 120,
      child: Image.asset(
        img,
      ),
    );
    /*Image.asset(
      img,
      fit: BoxFit.cover,
    );*/
  }
}
