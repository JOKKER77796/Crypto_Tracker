import 'package:cryptoapp/ViewModels/HomeViewModel.dart';
import 'package:cryptoapp/conatnts/theams.dart';
import 'package:cryptoapp/routes/routes.dart';
import 'package:cryptoapp/routes/routesname.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeModel()),
          ChangeNotifierProvider(create: (context) => theamchanger()),
        ],
        child: Consumer<theamchanger>(builder: (context, value, child) {
          return MaterialApp(
            themeMode: value.themeMode,
            theme: LiightTheam,
            darkTheme: DaarkTheam,
            initialRoute: routsName.home,
            onGenerateRoute: AppRoutes.getRoute,
          );
        }));
  }
}
