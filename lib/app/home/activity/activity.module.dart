import 'package:birdablo_mobile/app/home/activity/activity.view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ActivityModule extends WidgetModule {
  static Inject get to => Inject<ActivityModule>.of();

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => ActivityScreen()),
      ];

  @override
  Widget get view => ActivityScreen();
}
