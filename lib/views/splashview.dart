import 'dart:async';
import 'dart:math' as math;
import 'package:cryptoapp/routes/routesname.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/views/Homeview.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: Duration(seconds: 4))
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose

    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, routsName.home));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              AnimatedBuilder(
                  animation: controller,
                  child: Container(
                    height: 200,
                    width: 200,
                    child: const Center(
                        child: Image(
                      image: AssetImage("Images/c.png"),
                    )),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: controller.value * 2 * math.pi,
                      child: child,
                    );
                  }),
              const SizedBox(
                height: 40,
              ),
              Shimmer.fromColors(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Crypto ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 3, 3, 3)),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Tracker",
                      style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 3, 3, 3)),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                baseColor: Color.fromARGB(255, 8, 118, 209),
                highlightColor: Color.fromARGB(255, 203, 210, 216),
              )
            ]),
      )),
    );
  }
}
