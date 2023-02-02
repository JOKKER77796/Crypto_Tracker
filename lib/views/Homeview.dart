import 'dart:async';

import 'package:cryptoapp/ViewModels/HomeViewModel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

@override
void initState() {
  HomeModel.Getcryptolist();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 7, right: 7, bottom: 0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Crypto Tracker",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.dark_mode),
                iconSize: 30,
              )
            ])
          ],
        ),
      )),
    );
  }
}
