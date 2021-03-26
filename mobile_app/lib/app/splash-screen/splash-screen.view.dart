import 'dart:async';

import 'package:birdablo_mobile/app/app.module.dart';
import 'package:birdablo_mobile/app/components/loading-dots/loading-dots.component.dart';
import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Timer> startTime() async => Timer(Duration(seconds: 3), navigationPage);

  void navigationPage() => Modular.to.pushReplacementNamed(AppModule.home);

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: LoadingDots(numberDots: 5)),
        ],
      ),
    );
  }
}
