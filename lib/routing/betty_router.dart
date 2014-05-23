library betty_router;

import 'package:angular/angular.dart';

bettyRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'home': ngRoute(
        defaultRoute: true,
        enter: views('view/home.html')),
    'menu': ngRoute(
        path: '/menu',
        enter: views('view/menu.html'))
  });
}