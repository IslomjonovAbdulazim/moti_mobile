import 'dart:convert';

List<Product> productListFromJson(String str) {
  List list = jsonDecode(str);
  List<Product> allProducts = list.map((e) => Product.fromJson(e)).toList();
  return allProducts;
}
class Product {
  Product({
      this.id, 
      this.productName, 
      this.categoryId, 
      this.categoryName,
      this.description,
      this.price, 
      this.imageUrl, 
      this.discount, 
      this.favourite, 
      this.readyTime,
      this.active,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    productName = json['productName'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    discount = json['discount'];
    favourite = json['favourite'];
    readyTime = json['readyTime'];
    active = json['active'];
  }
  int? id;
  String? productName;
  int? categoryId;
  String? categoryName;
  String? description;
  double? price;
  String? imageUrl;
  double? discount;
  bool? favourite;
  String? readyTime;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productName'] = productName;
    map['categoryId'] = categoryId;
    map['categoryName'] = categoryName;
    map['description'] = description;
    map['price'] = price;
    map['imageUrl'] = imageUrl;
    map['discount'] = discount;
    map['favourite'] = favourite;
    map['readyTime'] = readyTime;
    map['active'] = active;
    return map;
  }

}