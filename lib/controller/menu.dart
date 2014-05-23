library menu_controller;

import 'package:angular/angular.dart';
import 'dart:async';

//import 'package:bugeyedbettys/service/queryservice.dart';
import 'package:bugeyedbettys/service/dish.dart';

@Controller(
    selector: '[menu]',
    publishAs: 'ctrl')
class MenuController {
  
  static const String LOADING_MESSAGE = "Loading menu...";
  static const String ERROR_MESSAGE = "Sorry! The menu is not unfolding properly...please wait for the waiter to help.";
  
  final Http _http;
//  final QueryService queryService;
  
  // Determine the initial load state of the app
  String message = LOADING_MESSAGE;
  bool menuLoaded = false;
  bool categoriesLoaded = false;
  
  // Data objects that are loaded from the server side via json
  List<String> _categories = [];
  List<String> get categories => _categories;
  
  List<Map<String, dynamic>> _menuMap;
  List<Map<String, dynamic>> get menu => _menuMap;
  
  MenuController(this._http) { // old params: this._http, this.queryService
    _loadData();
  }
  
//  void _loadData() {
//    queryService.getMenu()
//      .then((List<Map<String, dynamic>> wholeMenu) {
//      
//        _menuMap = wholeMenu;
//        menuLoaded = true;
//        
//        _menuMap.forEach((c) => _categories.add(c['name']));
//        categoriesLoaded = true;
//        
//      })
//      .catchError((e) {
//      
//        print(e);
//        menuLoaded = false;
//        categoriesLoaded = false;
//        message = ERROR_MESSAGE;
//        
//      });
//  }
  List<Map<String, dynamic>> _menuCache;
  List<Map<String, dynamic>> _dishCache;
  String _menuUrl = "menu.json";
  
  Future _loadData() {
      return _http.get(_menuUrl)
          .then((HttpResponse response) {
            _menuCache = new List<Map<String, dynamic>>();
            for (Map category in response.data) {
              String catName = category['name'];
              String description = category['desc']; // category['desc'].isNull() ? "" : category['desc'];
              Map c = {'name': catName, 'desc': description, 'items': []};
              _menuCache.add(c);
              _dishCache = category['items'];
              for (Map item in _dishCache) {
                Dish d = new Dish.fromJson(item);
                _menuCache.last['items'].add(d);
              }
            }
            menuLoaded = true;
            _menuMap = _menuCache;
            
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