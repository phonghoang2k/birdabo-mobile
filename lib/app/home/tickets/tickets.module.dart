import 'package:birdablo_mobile/app/home/tickets/tickets.view.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TicketsModule extends WidgetModule {
  static Inject get to => Inject<TicketsModule>.of();

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => TicketsScreen()),
      ];

  @override
  Widget get view => TicketsScreen();
}
