library queryservice;

import 'dart:async';

import 'package:angular/angular.dart';

//import 'package:bugeyedbettys/service/dish.dart';

@Injectable()
class QueryService {
  
  String _menuUrl = 'menu.json';
  
  Future _loaded;
  
  List<Map<String, dynamic>> _menuCache;
  
  
  final Http _http;
  
  QueryService(Http this._http){
    _loaded = Future.wait([_loadData()]);
  }
  
  Future _loadData() {
    return _http.get(_menuUrl)
        .then((HttpResponse response) {
          _menuCache = new List<Map<String, dynamic>>();
          for (Map category in response.data) {
            String catName = category['name'];
            String description = category['desc']; // category['desc'].isNull() ? "" : category['desc'];
            Map c = {'name': catName, 'desc': description, 'items': []};
            _menuCache.add(c);
            List<Map<String, dynamic>> dishes = category['items'];
            for (Map item in dishes) {
//              Dish d = new Dish.fromJson(item);
//              _menuCache.last['items'].add(d);
            }
          }
        });
  }
  
  Future<List<Map<String, dynamic>>> getMenu() {
    return _menuCache == null
        ? _loaded.then((_) => _menuCache)
        : new Future.value(_menuCache);
  }
}

