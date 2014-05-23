library menu_category_component;

import 'package:angular/angular.dart';

import 'package:bugeyedbettys/service/queryservice.dart';
import 'package:bugeyedbettys/service/dish.dart';

@Component(
    selector: 'menu-category',
    templateUrl: '../lib/component/menu_category.html',
    publishAs: 'cmp'
)
class MenuCategoryComponent {
  
  @NgOneWay('name')
  String name;
  
  @NgOneWay('dish-list')
  List<String, Dish> dishList;
   
}