import 'package:birdablo_mobile/app/home/explore/explore.view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExploreModule extends WidgetModule {
  static Inject get to => Inject<ExploreModule>.of();

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => ExploreScreen()),
      ];

  @override
  Widget get view => ExploreScreen();
}
