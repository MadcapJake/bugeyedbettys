library bugeyedbettys;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
//import 'package:angular_ui/angular_ui.dart';
import 'package:logging/logging.dart';

import 'dart:html';
import 'dart:convert';
import 'dart:async';

import 'package:logging/logging.dart' show Logger;

@MirrorsUsed(
    targets: const ['menu_controller', 'carousel_component', 'betty_router', 'menu_category_component', 'menu_item_component'],
    override: '*')
import 'dart:mirrors';

//import 'package:bugeyedbettys/controller/carousel.dart';
//import 'package:bugeyedbettys/controller/menu.dart';
//import 'package:bugeyedbettys/routing/betty_router.dart';
//import 'package:bugeyedbettys/service/queryservice.dart';
//import 'package:bugeyedbettys/component/carousel.dart';
//import 'package:bugeyedbettys/component/menu_category.dart';
//import 'package:bugeyedbettys/component/menu_item.dart';

part '../lib/component/carousel.dart';
part '../lib/component/menu_category.dart';
part '../lib/component/menu_item.dart';

part '../lib/controller/menu.dart';

part '../lib/routing/betty_router.dart';

part '../lib/service/dish.dart';

class MainModule extends Module {
  
  MainModule() {
//    install(new AngularUIModule());
    // Controllers
//    bind(CarouselController);
    bind(MenuController);
    
    // Services
//    bind(QueryService);
    
    // Components
    bind(CarouselComponent);
    bind(MenuCategoryComponent);
    bind(MenuItemComponent);
    
    // Routing
    bind(RouteInitializerFn, toValue: bettyRouteInitializer);
    bind(NgRoutingUsePushState,
        toFactory: (_) => new NgRoutingUsePushState.value(false));
  }
  
}

void main() {
  Logger.root..level = Level.FINEST
             ..onRecord.listen((LogRecord r) { print(r.message); });
  applicationFactory()
    .addModule(new MainModule())
    .run();
}



