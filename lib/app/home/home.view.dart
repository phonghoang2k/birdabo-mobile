import 'package:birdablo_mobile/app/home/explore/explore.module.dart';
import 'package:birdablo_mobile/app/home/home.module.dart';
import 'package:birdablo_mobile/app/home/tickets/tickets.module.dart';
import 'package:birdablo_mobile/resources/default.i18n.dart';
import 'package:birdablo_mobile/themes/style.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> _mainModules = [
    {'image': 'explore', 'label': 'Explore', 'widget': ExploreModule(), 'route': HomeModule.explore},
    {'image': 'commute', 'label': 'Commute', 'widget': Container(), 'route': HomeModule.commute},
    {'image': 'tickets', 'label': 'Tickets', 'widget': TicketsModule(), 'route': HomeModule.tickets},
    {'image': 'activity', 'label': 'Activity', 'widget': Container(), 'route': HomeModule.activity},
  ];
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainModules.elementAt(_bottomNavIndex)["widget"] as Widget,
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.buttonColor,
          unselectedItemColor: Colors.black,
          elevation: 0,
          unselectedFontSize: 11,
          selectedFontSize: 11,
          currentIndex: _bottomNavIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          selectedLabelStyle: TextStyle(fontSize: 13),
          items: _mainModules
              .map((e) => BottomNavigationBarItem(
                    icon:
                        Image.asset("assets/images/navigation-bar/${e["image"]}${_mainModules.indexOf(e) == _bottomNavIndex ? "-selected" : ""}.png"),
                    label: "${e["label"]}".i18n,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
