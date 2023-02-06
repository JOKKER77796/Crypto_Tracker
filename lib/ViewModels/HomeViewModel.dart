import 'dart:async';
import 'package:cryptoapp/Model/CryptoListModel.dart';
import 'package:cryptoapp/Model/localStorage.dart';
import 'package:cryptoapp/Services/HomeCryptoapi.dart';
import 'package:flutter/material.dart';

class HomeModel with ChangeNotifier {
  bool isloading = true;
  List<CrptoList> HomeCryptoList = [];
  HomeModel() {
    gettlist();
  }
  void gettlist() async {
    List<dynamic> lst = await HomeService.Getcryptolist();
    List<String> fav = await LocalStorage.fatchFavorites();

    List<CrptoList> temp = [];
    for (var HomeCryptoList in lst) {
      CrptoList newCrypto = CrptoList.fromJson(HomeCryptoList);
      if (fav.contains(newCrypto.id)) {
        newCrypto.isfav = true;
      }
      temp.add(newCrypto);
    }
    HomeCryptoList = temp;
    isloading = false;
    notifyListeners();

    Timer(Duration(seconds: 5), (() => gettlist()));
  }

  CrptoList getCCdetail(String id) {
    CrptoList ccd =
        HomeCryptoList.where((element) => element.id == id).toList()[0];
    return ccd;
  }

  void addFav(CrptoList crypto) async {
    int indxOfcrypto = await HomeCryptoList.indexOf(crypto);

    HomeCryptoList[indxOfcrypto].isfav = true;
    await LocalStorage.addFavorites(crypto.id!);

    notifyListeners();
  }

  void removeFav(CrptoList crypto) async {
    int indxOfcrypto = HomeCryptoList.indexOf(crypto);
    HomeCryptoList[indxOfcrypto].isfav = false;
    await LocalStorage.removeFavorite(crypto.id!);
    notifyListeners();
  }
}

class theamchanger with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheam() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    print("tap");
    notifyListeners();
  }
}
