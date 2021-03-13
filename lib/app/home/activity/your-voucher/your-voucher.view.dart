import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:birdablo_mobile/resources/activity/activity.i18n.dart';
import 'package:flutter/material.dart';

class YourVoucher extends StatefulWidget {
  @override
  _YourVoucherState createState() => _YourVoucherState();
}

class _YourVoucherState extends State<YourVoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 20),
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
            Stack(
              children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 12),
                IconButton(icon: Image.asset("assets/images/tickets/back-arrow.png"), onPressed: () => Navigator.pop(context)),
              ],
            ),
            Container(
              margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Your Rewards".i18n, style: TextStyle(fontSize: 40, color: Color(0xFF404040), fontWeight: FontWeight.w700))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
