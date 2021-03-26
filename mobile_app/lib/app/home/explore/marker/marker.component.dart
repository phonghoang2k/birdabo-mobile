import 'package:flutter/cupertino.dart';

class MarkerWidget extends StatelessWidget {
  final double angle;

  const MarkerWidget({Key key, this.angle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(angle: angle, child: Image.asset("assets/images/explore/sector.png",  width: 100)),
        Image.asset("assets/images/explore/marker.png", width: 30),
      ],
    );
  }
}
