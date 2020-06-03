import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:covid_app/data/network/config.dart';

class HomeService {
  Future<Map<String, dynamic>> getConfirmed() async {
    String url = ApiRoutes.apiPortalGeral;
    var response = await http.get(url);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    }
    return Future.error((error){
      print("getConfirmed() error: $error");
    });
  }
}