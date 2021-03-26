import 'package:birdablo_mobile/app/app.view.dart';
import 'package:birdablo_mobile/app/home/home.module.dart';
import 'package:birdablo_mobile/app/splash-screen/splash-screen.view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  static Inject get to => Inject<AppModule>.of();
  static String home = "/home";
  static String login = "/login";
  // static String booking = "/booking";
  // static String profile = "/profile";
  // static String resetPassword = "/resetPassword";
  static String splashScreen = "/";

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
        ModularRouter(splashScreen, child: (context, args) => SplashScreen(), transition: TransitionType.scale),
        ModularRouter(home, module: HomeModule(), transition: TransitionType.rightToLeftWithFade),
      ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  @override
  Widget get bootstrap => AppWidget();
}
