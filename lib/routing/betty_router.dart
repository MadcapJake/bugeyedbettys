library betty_router;

import 'package:angular/angular.dart';

bettyRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'home': ngRoute(
        defaultRoute: true,
        enter: views('view/home.html')),
    'menu': ngRoute(
        path: '/menu',
        enter: views('view/menu.html')),
    'taps': ngRoute(
        path: '/taps',
        enter: views('view/taps.html')),
    'specials': ngRoute(
        path: '/specials',
        enter: views('views/specials.html'))
  });
}