import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CommonButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double depth;

  const CommonButton({Key key, this.child, this.onPressed, this.depth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2),
      onPressed: onPressed,
      style: NeumorphicStyle(
          depth: depth,
          color: Colors.white,
          lightSource: LightSource.topLeft,
          shadowDarkColor: Color.fromRGBO(191, 221, 255, 0.5),
          shadowLightColor: Color.fromRGBO(191, 221, 255, 0.5)),
      boxShape: NeumorphicBoxShape.stadium(),
      child: child,
    );
  }
}
