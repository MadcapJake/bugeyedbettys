part of bugeyedbettys;

@Component(
    selector: 'menu-item',
    visibility: Directive.CHILDREN_VISIBILITY, 
    templateUrl: 'packages/bugeyedbettys/component/menu_item.html',
    cssUrl: 'packages/bugeyedbettys/component/menu.css',
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
