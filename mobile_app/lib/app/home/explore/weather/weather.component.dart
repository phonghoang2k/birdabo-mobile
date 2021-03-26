import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
      child: IntrinsicWidth(
        child: Row(
          children: [
            Image.asset("assets/images/explore/weather.png", height: SizeConfig.safeBlockVertical * 3),
            SizedBox(width: SizeConfig.safeBlockHorizontal),
            Text("23°", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
