part of bugeyedbettys;

class Dish {
  String _name;
  String get name => _name;
  void set name(n) { _name = n; }
  String desc;
  int cost;
//  Ideas for later:
//  int rating;
//  String imgUrl;


  Dish(this._name, this.desc, this.cost);
  
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