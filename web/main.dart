library bugeyedbettys;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular_ui/angular_ui.dart';
import 'package:logging/logging.dart';

@MirrorsUsed(
    targets: const ['menu_controller', 'carousel_controller', 'betty_router', 'menu_category_component', 'menu_item_component', 'queryservice'],
    override: '*')
import 'dart:mirrors';

import 'package:bugeyedbettys/controller/carousel.dart';
import 'package:bugeyedbettys/controller/menu.dart';
import 'package:bugeyedbettys/routing/betty_router.dart';
import 'package:bugeyedbettys/service/queryservice.dart';
import 'package:bugeyedbettys/component/menu_category.dart';
import 'package:bugeyedbettys/component/menu_item.dart';

class MainModule extends Module {
  
  MainModule() {
    install(new AngularUIModule());
    bind(CarouselController);
    bind(MenuController);
    bind(QueryService);
    bind(MenuCategoryComponent);
    bind(MenuItemComponent);
    value(RouteInitializerFn, bettyRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
  
}

void main() {
  Logger.root..level = Level.FINEST
             ..onRecord.listen((LogRecord r) { print(r.message); });
  applicationFactory()
    .addModule(new MainModule())
    .run();
}



