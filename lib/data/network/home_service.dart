import 'dart:convert' as convert;
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:covid_app/data/network/config.dart';

class HomeService {
  Future<Map<String, dynamic>> getConfirmed(String filter) async {
    String url = ApiRoutes.baseUrl;
    if (filter == "Brazil") {
      url += ApiRoutes.geral;
    } else if (filter == "São Paulo") {
      url += ApiRoutes.estado;
    } else {
      url += ApiRoutes.municipio;
    }
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      if (filter == "Brazil") {
        return {
          'confirmed': jsonResponse['confirmados']['total'].toString(),
          'recovered': jsonResponse['confirmados']['recuperados'].toString(),
          'deaths': jsonResponse['obitos']['total'].toString(),
        };
      } else if (filter == "São Paulo") {
        print( jsonResponse[0]);
        return {
          'confirmed': jsonResponse[0]['casosAcumulado'].toString(),
          'recovered': '',
          'deaths': jsonResponse[0]['obitosAcumulado'].toString()
        };
      } else {
        print( jsonResponse[371]);
        return {
          'confirmed': jsonResponse[371]['casosAcumulado'].toString(),
          'recovered': '',
          'deaths': jsonResponse[371]['obitosAcumulado'].toString()
        };
      }
    }
    return Future.error((error) {
      print("getConfirmed() error: $error");
    });
  }

  Future<Placemark> getGeoInfos() async {
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    Position position;
    if (geolocationStatus == GeolocationStatus.granted) {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemark = await Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude);

      return placemark[0];
    }
  }
}
