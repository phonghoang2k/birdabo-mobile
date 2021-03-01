import 'dart:math';

import 'package:birdablo_mobile/app/home/explore/components/common-button/common-button.component.dart';
import 'package:birdablo_mobile/app/home/explore/explore.cubit.dart';
import 'package:birdablo_mobile/app/home/explore/marker/marker.component.dart';
import 'package:birdablo_mobile/app/home/explore/panel/panel.component.dart';
import 'package:birdablo_mobile/app/home/explore/search-bar/search-bar.component.dart';
import 'package:birdablo_mobile/app/home/explore/weather/weather.component.dart';
import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  MapController _mapController = MapController();
  PanelController _panelController = PanelController();
  ExploreCubit _cubit = ExploreCubit();

  Marker _marker;

  @override
  void initState() {
    final val = Random().nextDouble() * 2 * pi;
    _marker = Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(21.016147, 105.793532),
      builder: (ctx) => MarkerWidget(angle: val),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panel: PanelWidget(),
        controller: _panelController,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        minHeight: SizeConfig.safeBlockVertical * 15,
        snapPoint: 0.4,
        maxHeight: SizeConfig.safeBlockVertical * 95,
        onPanelOpened: _cubit.handlePanelReachMaxHeight,
        onPanelSlide: _cubit.handlePanelOffsetChange,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            FlutterMap(
              options: MapOptions(
                center: LatLng(21.016147, 105.793532),
                zoom: 15.0,
              ),
              mapController: _mapController,
              layers: [
                TileLayerOptions(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                  tileProvider: NonCachingNetworkTileProvider(),
                ),
                MarkerLayerOptions(markers: [_marker])
              ],
            ),
            BlocBuilder<ExploreCubit, ExploreState>(
              cubit: _cubit,
              buildWhen: (prev, now) => now is PanelSlideReachMaxHeight,
              builder: (context, state) => AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                top: (_cubit.isSwipeUp ? -3.5 : 1.0) * SizeConfig.safeBlockVertical * 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBarWidget(
                      onPressedSearch: () => print("aa"),
                      onPressedAvatar: () => print("bb"),
                    ),
                    Weather(),
                  ],
                ),
              ),
            ),
            BlocBuilder<ExploreCubit, ExploreState>(
              cubit: _cubit,
              buildWhen: (prev, now) => now is PanelSlideOffsetChanged,
              builder: (context, state) => AnimatedPositioned(
                bottom: _cubit.offset,
                duration: const Duration(milliseconds: 0),
                curve: Curves.fastLinearToSlowEaseIn,
                child: buildFloatingButtons(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFloatingButtons() => SizedBox(
        width: SizeConfig.screenWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CommonButton(
              onPressed: () {
                print("aa");
              },
              depth: 11,
              child: IntrinsicWidth(
                child: Row(
                  children: [
                    Image.asset("assets/images/explore/feedback.png", height: 20),
                    SizedBox(width: SizeConfig.safeBlockHorizontal),
                    Text("Feedback", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            Spacer(),
            IntrinsicHeight(
              child: Column(
                children: [
                  FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => print("aa"),
                    shape: CircleBorder(side: BorderSide.none),
                    child: Container(
                      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF7AC0EE), Color(0xFF5798D9), Color(0xFF2196F3)],
                          )),
                      child: ImageIcon(AssetImage("assets/images/explore/go-icon.png"), size: 30, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical),
                  FloatingActionButton(
                    onPressed: () => {_mapController.move(LatLng(21.016147, 105.793532), 15.0), _mapController.rotate(0)},
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/images/explore/mylocation.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
