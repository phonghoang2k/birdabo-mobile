import 'package:birdablo_mobile/app/app.module.dart';
import 'package:birdablo_mobile/config/application.dart';
import 'package:birdablo_mobile/utils/shared_preferences.dart';
import 'package:birdablo_mobile/utils/timeago_wrapper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;
  TimeAgoWrapper().init();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Color.fromRGBO(0, 181, 156, 1),
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  Application.sharePreference = await SpUtil.getInstance();
  runApp(ModularApp(module: AppModule()));
}
