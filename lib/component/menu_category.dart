part of bugeyedbettys;

@Component(
    selector: 'menu-category',
    visibility: Directive.CHILDREN_VISIBILITY, 
    templateUrl: 'packages/bugeyedbettys/component/menu_category.html',
    cssUrl: 'packages/bugeyedbettys/component/menu.css',
    publishAs: 'cmp'
)
class MenuCategoryComponent {
  
  @NgOneWay('name')
  String name;
  
  @NgOneWay('dish-list')
  List<Dish> dishlist;
   
}