import 'package:covid_app/data/network/home_service.dart';
import 'package:covid_app/shared_widgets/loading.dart';
import 'package:covid_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import './card_status.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  double initialPercentage = 0.65;
  TextEditingController regionController = TextEditingController();
  HomeService homeService = HomeService();
  Map<String, dynamic> covidData;
  String pais = "";
  String estado = "";
  String cidade = "";
  bool isLoading = true;
  bool isLoadingData = true;

  @override
  void initState() {
    super.initState();
    getData("Brazil");
    getGeoInfo();
  }

  void getGeoInfo() {
    homeService.getGeoInfos().then((value) {
      setState(() {
        estado = value.administrativeArea;
        cidade = value.subAdministrativeArea;
        pais = value.country;
        regionController.text = value.country;
        isLoading = false;
      });
    });
  }

  void getData(String filter) {
    homeService.getConfirmed(filter).then((value) {
      setState(() {
        covidData = value;
        isLoadingData = false;
      });
    }).catchError((onError) {
      print("error getData: $onError");
    });
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
        child: isLoading
            ? Loading()
            : Column(
                children: <Widget>[
                  _buildRegionInput(),
                  SizedBox(height: spacing(2)),
                  CardStatus(
                    filter: regionController.text,
                    covidData: covidData,
                    isLoading: isLoadingData,
                  ),
                  SizedBox(height: spacing(2)),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Image.asset(
                        'assets/images/novo-mapa.jpg',
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Widget _buildRegionInput() {
    return Container(
      height: 50.0,
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (ctx) {
                return Align(
                  alignment: Alignment.center,
                  child: AlertDialog(
                    content: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        width: 200,
                        height: 170,
                        child: ListView(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            RadioListTile(
                              groupValue: regionController.text,
                              value: pais,
                              title: Text('Pais'),
                              onChanged: (v) {
                                setState(() {
                                  regionController.text = v;
                                  isLoadingData = true;
                                });
                                getData(v);
                                Navigator.of(context).pop();
                              },
                            ),
                            RadioListTile(
                              groupValue: regionController.text,
                              value: estado,
                              title: Text('Estado'),
                              onChanged: (v) {
                                setState(() {
                                  regionController.text = v;
                                  isLoadingData = true;
                                });
                                getData(v);
                                Navigator.of(context).pop();
                              },
                            ),
                            RadioListTile(
                              groupValue: regionController.text,
                              value: cidade,
                              title: Text('Município'),
                              onChanged: (v) {
                                setState(() {
                                  regionController.text = v;
                                  isLoadingData = true;
                                });
                                getData(v);
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                );
              });
        },
        child: TextField(
          enabled: false,
          controller: regionController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.location_on),
              hintText: 'Filtrar',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Color(0xffE1E1E1), width: 0.8),
              ),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 2)),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
