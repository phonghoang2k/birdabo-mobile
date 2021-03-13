import 'package:auto_size_text/auto_size_text.dart';
import 'package:birdablo_mobile/app/home/activity/activity.module.dart';
import 'package:birdablo_mobile/app/home/activity/component/bar-chart/bar-chart.component.dart';
import 'package:birdablo_mobile/app/home/explore/components/common-button/common-button.component.dart';
import 'package:birdablo_mobile/app/home/home.module.dart';
import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:birdablo_mobile/resources/activity/activity.i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
            SizedBox(height: SizeConfig.safeBlockVertical * 12),
            Container(
              margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Activity".i18n, style: TextStyle(fontSize: 40, color: Color(0xFF404040), fontWeight: FontWeight.w700))),
                  overviewActivityWidget(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 3),
                    height: 1,
                    width: SizeConfig.safeBlockHorizontal * 90,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color.fromRGBO(255, 255, 255, 0), Color.fromRGBO(74, 116, 203, 1), Color.fromRGBO(255, 255, 255, 0)])),
                  ),
                  overviewCouponWidget(),
                  SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  overviewDetailsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget overviewActivityWidget() => Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 11,
            shadowColor: Color.fromRGBO(191, 221, 255, 0.5),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                width: SizeConfig.safeBlockHorizontal * 45,
                height: SizeConfig.safeBlockHorizontal * 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.white, Color(0xFFEAF6FF)])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/activity/coin.png", width: SizeConfig.safeBlockHorizontal * 10),
                    Spacer(flex: 3),
                    Text("699", style: TextStyle(fontSize: 70, fontWeight: FontWeight.w600)),
                    Text("total points".i18n),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 8,
                          alignment: Alignment.centerLeft,
                          child: Image.asset("assets/images/activity/ion_footsteps.png"),
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
                        Text("121", style: TextStyle(fontSize: 50)),
                      ],
                    ),
                    Text("walking points"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset("assets/images/activity/bus.png"),
                          width: SizeConfig.safeBlockHorizontal * 8,
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
                        Text("572", style: TextStyle(fontSize: 50)),
                      ],
                    ),
                    Text("bus points"),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      );

  Widget overviewCouponWidget() => Column(
        children: [
          Container(
            margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
            child: Row(
              children: [
                Text("11 coupons available".i18n,
                    style: TextStyle(
                      color: Color(0xFF2196F3),
                      fontSize: 16,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w600,
                    )),
                Spacer(),
                CommonButton(
                  child: Row(
                    children: [
                      Image.asset("assets/images/activity/voucher.png", width: SizeConfig.safeBlockHorizontal * 5),
                      SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
                      Text("Rewards", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  onPressed: () => Modular.link.pushNamed(HomeModule.activity + ActivityModule.yourVoucher),
                )
              ],
            ),
          ),
          Card(
            color: Color(0xFF2196F3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              height: SizeConfig.safeBlockVertical * 15,
              child: Row(
                children: [
                  Image.asset("assets/images/activity/happy_birthday.png", height: SizeConfig.safeBlockVertical * 10),
                  Expanded(
                    child: AutoSizeText.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "Get 1000 points by the end of this month to get special prizes!",
                            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
                        TextSpan(text: "\nTap here to get direction + get a voucher when you get there.", style: TextStyle(color: Colors.white)),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );

  Widget overviewDetailsWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
            child: Column(
              children: [
                Align(
                  child: Text("Details".i18n,
                      style: TextStyle(
                        color: Color(0xFF2196F3),
                        fontSize: 17,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w600,
                      )),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Today steps", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                        Text("1811", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Spacer(flex: 1),
                    Container(
                      margin: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 3),
                      width: SizeConfig.safeBlockHorizontal * 30,
                      child: Text("+20% compared to yesterday", style: TextStyle(fontSize: 17, color: Colors.grey)),
                    ),
                    Spacer(flex: 3),
                    Image.asset("assets/images/activity/ion_footsteps.png", width: SizeConfig.safeBlockHorizontal * 10)
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
            child: Column(
              children: [
                Container(
                  child: SimpleBarChart.withSampleData(),
                  height: SizeConfig.safeBlockVertical * 36,
                ),
              ],
            ),
          )
        ],
      );
}
