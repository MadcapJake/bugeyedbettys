library menu_controller;

import 'package:angular/angular.dart';

import 'package:bugeyedbettys/service/queryservice.dart';
import 'package:bugeyedbettys/service/dish.dart';

@Controller(
    selector: '[menu]',
    publishAs: 'ctrl')
class MenuController {
  
  static const String LOADING_MESSAGE = "Loading menu...";
  static const String ERROR_MESSAGE = "Sorry! The menu is not unfolding properly...please wait for the waiter to help.";
  
  final Http _http;
  final QueryService queryService;
  
  // Determine the initial load state of the app
  String message = LOADING_MESSAGE;
  bool menuLoaded = false;
  bool categoriesLoaded = false;
  
  // Data objects that are loaded from the server side via json
  List<String> _categories = [];
  List<String> get categories => _categories;
  
  List<Map<String, dynamic>> _menuMap;
  List<Map<String, dynamic>> get menu => _menuMap;
  
  MenuController(this._http, this.queryService) {
    _loadData();
  }
  
  void _loadData() {
    queryService.getMenu()
      .then((List<Map<String, dynamic>> wholeMenu) {
      
        _menuMap = wholeMenu;
        menuLoaded = true;
        
        _menuMap.forEach((c) => _categories.add(c['name']));
        categoriesLoaded = true;
        
      })
      .catchError((e) {
      
        print(e);
        menuLoaded = false;
        categoriesLoaded = false;
        message = ERROR_MESSAGE;
        
      });
  }
  
  List<String, Dish> dishlist(name) =>
    menu.lastWhere((cat) => name == cat['name'])['items'];
  
}