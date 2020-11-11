import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gti/components/constants.dart';

class LoginService {
  LoginService({this.url});
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future postData(String userName, String userEmail, String id) async {
    http.Response response = await http.post(url, body: {
      "api_id": kApiId,
      "api_key": kApiKey,
      "name": userName,
      "email": userEmail,
      "fb_id": id,
    });
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
