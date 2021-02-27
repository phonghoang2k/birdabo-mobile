import 'dart:math';

import 'package:birdablo_mobile/app/home/explore/components/marker/marker.component.dart';
import 'package:birdablo_mobile/app/home/explore/components/panel/panel.component.dart';
import 'package:birdablo_mobile/app/home/explore/components/search-bar/search-bar.component.dart';
import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:flutter/material.dart';
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
        minHeight: SizeConfig.safeBlockVertical * 45,
        maxHeight: SizeConfig.safeBlockVertical * 90,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            FlutterMap(
              options: MapOptions(center: LatLng(21.016147, 105.793532), zoom: 15.0),
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
            SearchBarWidget(
              onPressedSearch: () => print("aa"),
              onPressedAvatar: () => print("bb"),
            ),
          ],
        ),
      ),
    );
  }
}
