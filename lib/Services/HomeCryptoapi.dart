import 'dart:convert';

import 'package:http/http.dart' as http;

import '../conatnts/Appurls.dart';

class HomeService {
  static Future<List<dynamic>> Getcryptolist() async {
    var response = await http.get(Uri.parse(AppUrl.Cryptolist));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<dynamic> Cryptolist = data as List<dynamic>;
      return Cryptolist;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
