import 'dart:convert';

class Prod {
  Prod({
      this.id, 
      this.category, 
      this.description, 
      this.price, 
      this.imageUrl, 
      this.discount, 
      this.readyTime, 
      this.available, 
      this.active,});

  Prod.fromJson(dynamic json) {
    id = json['id'];
    category = json['category'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    discount = json['discount'];
    readyTime = json['readyTime'];
    available = json['available'];
    active = json['active'];
  }
  num? id;
  String? category;
  String? description;
  num? price;
  String? imageUrl;
  num? discount;
  String? readyTime;
  bool? available;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = category;
    map['description'] = description;
    map['price'] = price;
    map['imageUrl'] = imageUrl;
    map['discount'] = discount;
    map['readyTime'] = readyTime;
    map['available'] = available;
    map['active'] = active;
    return map;
  }

}