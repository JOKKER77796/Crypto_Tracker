import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../conatnts/Appurls.dart';

class HomeService {
  static Future<List<dynamic>> Getcryptolist() async {
    try {
      var response = await http.get(Uri.parse(AppUrl.Cryptolist));
      var data = jsonDecode(response.body);

      List<dynamic> Cryptolist = data as List<dynamic>;
      return Cryptolist;
    } on SocketException {
      print("ERR");
      List<dynamic> Cryptolist = [];
      return Cryptolist;
    } catch (exp) {
      print(exp);

      List<dynamic> Cryptolist = [];
      return Cryptolist;
    }
  }
}
