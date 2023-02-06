import 'package:cryptoapp/Model/CryptoListModel.dart';
import 'package:cryptoapp/ViewModels/HomeViewModel.dart';
import 'package:cryptoapp/conatnts/reUsables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModel>(builder: ((context, value, child) {
      List<CrptoList> favlist =
          value.HomeCryptoList.where((element) => element.isfav == true)
              .toList();

      return ListView.builder(
        itemCount: favlist.length,
        itemBuilder: (context, index) =>
            ReusableListTile(currntcrpto: favlist[index]),
      );
    }));
  }
}
