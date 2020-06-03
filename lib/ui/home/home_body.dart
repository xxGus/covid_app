import 'package:covid_app/data/network/home_service.dart';
import 'package:covid_app/shared_widgets/loading.dart';
import 'package:covid_app/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  double initialPercentage = 0.65;
  TextEditingController regionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    regionController.text = 'Brasil';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 250),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
            color: Color(0xFFFEFEFE)),
        padding: EdgeInsets.only(top: 26, left: 22, right: 22, bottom: 25),
        child: Column(
          children: <Widget>[
            _buildRegionInput(),
            SizedBox(height: spacing(2)),
            CardStatus(),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionInput() {
    return Container(
      height: 50.0,
      child: TextField(
        enabled: false,
        controller: regionController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_on),
            hintText: 'Cari Daerah Terdampak',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Color(0xffE1E1E1), width: 0.8),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 2)),
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}

class CardStatus extends StatefulWidget {
  CardStatus({
    Key key,
  }) : super(key: key);

  @override
  _CardStatusState createState() => _CardStatusState();
}

class _CardStatusState extends State<CardStatus> {
  HomeService homeService = HomeService();
  Map<String, dynamic> covidData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    homeService.getConfirmed().then((value) {
      print(value);
      setState(() {
        covidData = value;
        isLoading = false;
      });
    }).catchError((onError) {
      print("error getData: $onError");
    });
  }

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
        child: isLoading ? Loading() : buildRowUpdateCases(
          confirmed: covidData['confirmados']['total'].toString(),
          recovered: covidData['confirmados']['recuperados'].toString(),
          deaths: covidData['obitos']['total'].toString(),
        ),
      ),
    );
  }
}

Container buildIconHeader({icon, color}) {
  return Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      color: Color.alphaBlend(Colors.white70, color),
      borderRadius: BorderRadius.circular(26.0),
    ),
    child: Center(
      child: Icon(
        icon,
        size: 24.0,
        color: color,
      ),
    ),
  );
}

Row buildRowUpdateCases({String confirmed, String recovered, String deaths}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        children: <Widget>[
          buildIconHeader(icon: Icons.add, color: Colors.orange),
          buildNumberCount(value: confirmed, color: Colors.orange),
          Text('Total'),
        ],
      ),
      Column(
        children: <Widget>[
          buildIconHeader(icon: Icons.healing, color: Colors.green),
          buildNumberCount(value: recovered, color: Colors.green),
          Text('Recuperados'),
        ],
      ),
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
