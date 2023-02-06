import 'package:cryptoapp/conatnts/reUsables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/CryptoListModel.dart';
import '../ViewModels/HomeViewModel.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModel>(
      builder: (context, provider, child) {
        if (provider.isloading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: provider.HomeCryptoList.length,
            itemBuilder: (context, index) {
              CrptoList currntcrpto = provider.HomeCryptoList[index];
              return com(currntcrpto: currntcrpto);
            },
          );
        }
      },
    );
  }
}
