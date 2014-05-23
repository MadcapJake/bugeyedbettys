library dish;

class Dish {
  String name;
  String desc;
  int cost;
//  Ideas for later:
//  int rating;
//  String imgUrl;


  Dish(this.name, this.desc, this.cost);
  
//  Map<String, dynamic> toJson() => <String, dynamic>{
//    "name": name,
//    "desc": desc,
//    "cost": cost
//  };

  Dish.fromJson(Map<String, dynamic> json) {
      this.name = json['name'];
      this.desc = json['desc'];
      this.cost = json['cost'];
  }
}