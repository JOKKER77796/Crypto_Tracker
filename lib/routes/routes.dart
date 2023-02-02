import 'package:cryptoapp/routes/routesname.dart';
import 'package:cryptoapp/views/splashview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/Homeview.dart';

class AppRoutes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case routsName.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case routsName.Splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Container(
                child: Text("no routes"),
              ),
            ),
          );
        });
    }
  }
}
