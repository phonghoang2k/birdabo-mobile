import 'package:birdablo_mobile/app/home/activity/activity.module.dart';
import 'package:birdablo_mobile/app/home/explore/explore.module.dart';
import 'package:birdablo_mobile/app/home/home.view.dart';
import 'package:birdablo_mobile/app/home/tickets/tickets.module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  static Inject get to => Inject<HomeModule>.of();
  static String activity = "/activity";
  static String commute = "/commute";
  static String explore = "/explore";
  static String tickets = "/tickets";

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => Home()),
        ModularRouter(explore, module: ExploreModule()),
        ModularRouter(tickets, module: TicketsModule()),
        ModularRouter(activity, module: ActivityModule()),
        // ModularRouter(dashboard, module: DashboardModule()),
        // ModularRouter(stockChecking, module: StockCheckingModule()),
        // ModularRouter(knowledge, module: KnowledgeModule()),
        // ModularRouter(profile, module: ProfileModule()),
        // ModularRouter(notification, child: (context, args) => NotificationPanel()),
      ];
}
