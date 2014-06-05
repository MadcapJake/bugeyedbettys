part of bugeyedbettys;

bettyRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'home': ngRoute(
        defaultRoute: true,
        enter: views('view/home.html')),
    'menu': ngRoute(
        path: '/menu',
        enter: views('view/menu.html')),
    'taps': ngRoute(
        path: '/drinks',
        enter: views('view/drinks.html')),
    'specials': ngRoute(
        path: '/specials',
        enter: views('view/specials.html')),
    'gift-cards': ngRoute(
        path: '/gift-cards',
        enter: views('view/gift-cards.html')),
    'gallery': ngRoute(
        path: '/gallery',
        enter: views('view/gallery.html')),
    'about': ngRoute(
        path: '/about',
        enter: views('view/about.html'))
  });
}