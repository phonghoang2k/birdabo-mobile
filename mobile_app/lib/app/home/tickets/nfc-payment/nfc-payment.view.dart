import 'dart:ui';

import 'package:birdablo_mobile/app/app.module.dart';
import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:birdablo_mobile/resources/tickets/tickets.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NFCPaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(end: Alignment.bottomCenter, begin: Alignment.topCenter, colors: [Color(0xFFFAFAFA), Color(0xFFF7FBFF)])),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical * 3),
            Image.asset("assets/images/tickets/success.png", width: SizeConfig.safeBlockHorizontal * 40),
            Text("Success", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600)),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Text("Your payment is now completed.".i18n, style: TextStyle(fontSize: 18)),
            SizedBox(height: SizeConfig.safeBlockVertical * 5),
            Text("Thank you for using the NFC payment method,".i18n, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            Spacer(),
            RaisedButton(
              color: Color(0xFF4CA7F0),
              onPressed: () => Modular.to.popUntil(ModalRoute.withName(AppModule.home)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                child:
                    Center(child: Text("Back to Home Page".i18n, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25))),
                width: SizeConfig.safeBlockHorizontal * 80,
                height: SizeConfig.safeBlockVertical * 8,
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical),
          ],
        ),
      ),
    );
  }
}
