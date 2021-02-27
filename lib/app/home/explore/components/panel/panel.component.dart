import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:birdablo_mobile/resources/explore/explore.i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PanelWidget extends StatefulWidget {
  @override
  _PanelWidgetState createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final List<Map<String, dynamic>> _buttonData = [
    {
      "icon": "home.png",
      "color": LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF7EB6DA), Color(0xFF2876D8)]),
      "title": "Home"
    },
    {
      "icon": "work.png",
      "color": LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFDAAA7E), Color(0xFFFF8A00)]),
      "title": "Work"
    },
    {
      "title": "Pay Now",
      "icon": "paynow.png",
      "color": LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF7AD9DD), Color.fromRGBO(64, 223, 230, 0.5)])
    },
    {
      "title": "Add",
      "icon": "add.png",
      "color": LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFE7E7E7), Color(0xFFA5A5A5)])
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 60,
              height: 5,
              margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4),
            child: Row(
              children: [
                Text("Shortcuts".i18n, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
                Spacer(),
                Text("See All", style: TextStyle(color: Color(0xFF2196F3), fontWeight: FontWeight.w500, decoration: TextDecoration.underline)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 2),
            height: SizeConfig.safeBlockVertical * 14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _buttonData.length,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Container(
                    height: SizeConfig.safeBlockVertical * 9,
                    width: SizeConfig.safeBlockHorizontal * 16,
                    margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2, vertical: SizeConfig.safeBlockVertical),
                    decoration: BoxDecoration(gradient: _buttonData.elementAt(index)["color"] as LinearGradient, shape: BoxShape.circle),
                    child: FlatButton(
                      shape: CircleBorder(side: BorderSide.none),
                      onPressed: () {},
                      child: Image.asset("assets/images/explore/${_buttonData.elementAt(index)["icon"]}"),
                    ),
                  ),
                  Text("${_buttonData.elementAt(index)["title"]}", style: TextStyle(fontSize: 11), textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 4),
            child: Row(
              children: [
                Text("Nearby".i18n, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(bottom: 10),
                    physics: ScrollPhysics(),
                    child: Row(
                      children: List.generate(
                          4,
                          (index) => NeumorphicButton(
                                margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2),
                                onPressed: () {},
                                style: NeumorphicStyle(
                                    color: Colors.white,
                                    depth: 10,
                                    shadowLightColorEmboss: Color.fromRGBO(191, 221, 255, 0.5),
                                    shadowLightColor: Color.fromRGBO(191, 221, 255, 0.5)),
                                boxShape: NeumorphicBoxShape.stadium(),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2),
                                  child: Text("Category".i18n, style: TextStyle(color: Color(0xFF2196F3), fontWeight: FontWeight.w700, fontSize: 13)),
                                ),
                              )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
            child: Text("Discover".i18n, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
          )
        ],
      ),
    );
  }
}
