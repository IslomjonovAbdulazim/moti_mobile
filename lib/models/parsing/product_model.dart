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
      this.description, 
      this.price, 
      this.imageUrl, 
      this.discount, 
      this.favourite, 
      this.active,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    productName = json['productName'];
    categoryId = json['categoryId'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    discount = json['discount'];
    favourite = json['favourite'];
    active = json['active'];
  }
  int? id;
  String? productName;
  int? categoryId;
  String? description;
  num? price;
  String? imageUrl;
  num? discount;
  bool? favourite;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productName'] = productName;
    map['categoryId'] = categoryId;
    map['description'] = description;
    map['price'] = price;
    map['imageUrl'] = imageUrl;
    map['discount'] = discount;
    map['favourite'] = favourite;
    map['active'] = active;
    return map;
  }

}