import 'package:birdablo_mobile/config/config_screen.dart';
import 'package:birdablo_mobile/resources/explore/explore.i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SearchBarWidget extends StatefulWidget {
  final VoidCallback onPressedSearch;
  final VoidCallback onPressedAvatar;

  const SearchBarWidget({Key key, this.onPressedAvatar, this.onPressedSearch}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 11,
      shadowColor: Color.fromRGBO(191, 221, 255, 0.5),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2),
        width: SizeConfig.safeBlockHorizontal * 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Neumorphic(
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical),
                style: NeumorphicStyle(color: Color(0xFFFAFAFA), depth: -10, shadowLightColorEmboss: Color(0xFFEAF4FF)),
                child: FormBuilderTextField(
                  onTap: widget.onPressedSearch,
                  name: "search",
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search places and routes".i18n,
                      prefixIcon: Icon(Icons.search),
                      prefixIconConstraints: BoxConstraints(minWidth: 40)),
                ),
              ),
            ),
            SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
            ClipRRect(
              borderRadius: BorderRadius.circular(180),
              child: InkWell(
                child: Image.asset("assets/images/explore/avt.png"),
                onTap: widget.onPressedAvatar,
              ),
            )
          ],
        ),
      ),
    );
  }
}
