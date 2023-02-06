import 'package:cryptoapp/ViewModels/HomeViewModel.dart';
import 'package:cryptoapp/views/Favoriteview.dart';
import 'package:cryptoapp/views/MarketToday.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

@override
class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController tabviewcontroller;

  @override
  void initState() {
    super.initState();
    tabviewcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    theamchanger thmchng = Provider.of<theamchanger>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 7, bottom: 0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                "Crypto Today",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              IconButton(
                onPressed: () {
                  thmchng.changeTheam();
                },
                icon: (thmchng.themeMode == ThemeMode.light)
                    ? Icon(Icons.dark_mode_outlined)
                    : Icon(Icons.light_mode_outlined),
                iconSize: 30,
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            TabBar(controller: tabviewcontroller, tabs: [
              Tab(
                child: Text(
                  "All Crypto",
                  style: TextStyle(
                      color: (thmchng.themeMode == ThemeMode.light)
                          ? Colors.black
                          : Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Favorites",
                  style: TextStyle(
                      color: (thmchng.themeMode == ThemeMode.light)
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ]),
            Expanded(
              child: TabBarView(
                  controller: tabviewcontroller,
                  children: [Market(), FavoriteView()]),
            )
          ],
        ),
      )),
    );
  }
}
