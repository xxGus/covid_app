import 'package:covid_app/data/network/home_service.dart';
import 'package:covid_app/shared_widgets/loading.dart';
import 'package:covid_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:geolocator/geolocator.dart';

class CardStatus extends StatelessWidget {
  CardStatus({
    Key key,
    this.filter,
    this.covidData,
    this.isLoading,
  }) : super(key: key);

  bool isLoading;
  String filter;
  Map<String, dynamic> covidData;

  @override
  Widget build(BuildContext context) {
    double paddingAll = isLoading ? 52.0 : 16;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(paddingAll),
        child: isLoading
            ? Loading()
            : buildRowUpdateCases(
                confirmed: covidData['confirmed'],
                recovered: covidData['recovered'],
                deaths: covidData['deaths'],
                fase: covidData['fase'] != null ? covidData['fase'] : -1),
      ),
    );
  }
}

Container buildIconHeader({icon, color, size = 24.0}) {
  return Container(
    width: 48,
    height: 24,
    // decoration: BoxDecoration(
    //   color: Color.alphaBlend(Colors.white70, color),
    //   borderRadius: BorderRadius.circular(26.0),
    // ),
    child: Center(
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    ),
  );
}

Row buildRowUpdateCases(
    {String confirmed, String recovered, String deaths, int fase}) {
  return Row(
    mainAxisAlignment: recovered == ''
        ? MainAxisAlignment.spaceAround
        : MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        children: <Widget>[
          buildIconHeader(icon: Icons.add, color: Colors.orange),
          buildNumberCount(value: confirmed, color: Colors.orange),
          Text('Total'),
        ],
      ),
      recovered != ''
          ? Column(
              children: <Widget>[
                buildIconHeader(icon: Icons.healing, color: Colors.green),
                buildNumberCount(value: recovered, color: Colors.green),
                Text('Recuperados'),
              ],
            )
          : fase != -1
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildIconHeader(
                        icon: Icons.brightness_1, color: fases[fase - 1], size: 45.0),
                    // buildNumberCount(value: recovered, color: Colors.green),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text('Fase $fase'),
                    ),
                  ],
                )
              : Center(),
      Column(
        children: <Widget>[
          buildIconHeader(icon: Icons.close, color: Colors.red),
          buildNumberCount(value: deaths, color: Colors.red),
          Text('Óbitos'),
        ],
      ),
    ],
  );
}

Text buildNumberCount({String value, Color color}) {
  return Text(
    value,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget buildHeader({String title, String desc = '', Function onPressedAction}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontSize: 16,
            ),
          ),
          SizedBox(height: spacing(0.5)),
          Text(
            desc,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "Poppins",
              fontSize: 12,
            ),
          ),
        ],
      ),
      onPressedAction == null
          ? Container()
          : OutlineButton(
              onPressed: onPressedAction,
              child: Text("Lihat Detail"),
              color: primaryColor,
              textColor: Colors.purple,
              highlightedBorderColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
    ],
  );
}
