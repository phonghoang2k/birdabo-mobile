import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:birdablo_mobile/resources/tickets/tickets.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.safeBlockVertical * 4,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(126, 182, 218, 0.3), Color.fromRGBO(216, 216, 216, 0)],
              )),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 12),
            Container(
              margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
              child: Text("Activity".i18n, style: TextStyle(fontSize: 40, color: Color(0xFF404040), fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }
}
