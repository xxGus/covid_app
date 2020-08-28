import 'dart:convert' as convert;
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:covid_app/data/network/config.dart';
import 'package:diacritic/diacritic.dart';

class HomeService {
  Future<Map<String, dynamic>> getConfirmed(String filter) async {
    String url = ApiRoutes.baseUrl;
    if (filter == "Brazil") {
      url += ApiRoutes.geral;
    } else if (filter == "São Paulo" || filter == "Minas Gerais") {
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
        return {
          'confirmed': jsonResponse[0]['casosAcumulado'].toString(),
          'recovered': '',
          'deaths': jsonResponse[0]['obitosAcumulado'].toString()
        };
      } else if (filter == "Minas Gerais"){
        return {
          'confirmed': jsonResponse[4]['casosAcumulado'].toString(),
          'recovered': '',
          'deaths': jsonResponse[4]['obitosAcumulado'].toString()
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

  Future<Map<String, dynamic>> getCity(String city) async {
    String c = removeDiacritics(city);
    String url = ApiRoutes.localBaseUrl + ApiRoutes.municipios + "?city=$c";
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      Map<String, dynamic> obj = jsonResponse[jsonResponse.length - 1];
      int fase = await getDRS(obj['DRS']);
      return {
        'confirmed': obj['cases'].toString(),
        'recovered': '',
        'deaths': obj['deaths'].toString(),
        'fase': fase
      };
    }
    return Future.error((error) {
      print("getConfirmed() error: $error");
    });
  }

  Future<int> getDRS(String drs) async {
    String url = ApiRoutes.localBaseUrl + ApiRoutes.regioes + "?regioes=$drs";
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return int.parse(jsonResponse[0]['fase']);
    }
    
    return Future.error((error) {
      print("getConfirmed() error: $error");
    });
  }
}
