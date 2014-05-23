library menu_item_component;

import 'package:angular/angular.dart';

//import 'package:bugeyedbettys/lib/service/queryservice.dart';
import 'package:bugeyedbettys/service/dish.dart';

@Component(
    selector: 'menu-item',
    templateUrl: '../lib/component/menu_item.html',
    publishAs: 'cmp'
)
class MenuItemComponent {
  @NgOneWay('name')
  String name;
  
  @NgOneWay('desc')
  String desc;
  
  @NgOneWay('cost')
  int cost;
  
//  @NgOneWay('dish-map')
//  Dish currentDish;
//  
//  MenuItemComponent() {
//    name = currentDish.name;
//    desc = currentDish['desc'];
//    cost = currentDish['cost'];
//  }
  
}
