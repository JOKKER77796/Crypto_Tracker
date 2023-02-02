import 'dart:convert';

import 'package:cryptoapp/Model/CryptoListModel.dart';
import 'package:cryptoapp/conatnts/Appurls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeModel with ChangeNotifier {
  static Future<CrptoList> Getcryptolist() async {
    final response = await http.get(Uri.parse(AppUrl.Cryptolist));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(CrptoList.fromJson(data));
      return CrptoList.fromJson(data);
    } else {
      throw Exception("ere");
    }
  }
}
