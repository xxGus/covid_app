import 'package:covid_app/data/network/home_service.dart';
import 'package:covid_app/shared_widgets/loading.dart';
import 'package:covid_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
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
  Map<String, dynamic> city;
  String pais = "";
  String estado = "";
  String cidade = "";
  bool isLoading = true;
  bool isLoadingData = true;
  bool isSelected = false;
  PhotoViewController controller;
  PhotoViewController controllerFlex;

  double scaleCopy;
  double scaleCopyFlex;

  @override
  void initState() {
    super.initState();
    getData("Brazil");
    getGeoInfo();
    controller = PhotoViewController()..outputStateStream.listen(listener);
    controllerFlex = PhotoViewController()
      ..outputStateStream.listen(listenerFlex);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void listener(PhotoViewControllerValue value) {
    setState(() {
      scaleCopy = value.scale;
    });
  }

  void listenerFlex(PhotoViewControllerValue value) {
    setState(() {
      scaleCopyFlex = value.scale;
    });
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

  void getData(String filter, {bool city = false}) {
    if (!city) {
      homeService.getConfirmed(filter).then((value) {
        setState(() {
          covidData = value;
          isLoadingData = false;
        });
      }).catchError((onError) {
        print("error getData: $onError");
      });
    } else {
      homeService.getCity(filter).then((c) {
        setState(() {
          covidData = c;
          isLoadingData = false;
        });
      });
    }
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
                  isSelected
                      ? Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 5,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: PhotoView(
                                imageProvider: NetworkImage(
                                    "https://www.saopaulo.sp.gov.br/wp-content/uploads/2020/08/mapa-plano-sp-07082020.png"),
                                controller: controller,
                              ),
                            ),
                          ))
                      : Center(),
                  isSelected
                      ? Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 5,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14.0),
                              child: PhotoView(
                                imageProvider:
                                    NetworkImage("https://www.saopaulo.sp.gov.br/wp-content/uploads/2020/08/atividades-permitidas-2-3-v-agosto.jpg"),
                                controller: controllerFlex,
                              ),
                            ),
                          ),
                        )
                      : Center(),
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
                                  isSelected = false;
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
                                  isSelected = true;
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
                                  isSelected = true;
                                });
                                getData(v, city: true);
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
