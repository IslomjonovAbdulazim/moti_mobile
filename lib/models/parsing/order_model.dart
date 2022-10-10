
import 'product_model.dart';

class Order {
  late Product product;
  late int quantity;
  late double total;

  Order({
    required this.product,
    this.quantity = 0,
    required this.total,
  });

  Order.fromJson(Map<String, dynamic> json) {
    product = Product.fromJson(json["product"]);
    quantity = json['quantity'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() => {
    "product": product,
    "quantity": quantity,
    "total": total,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Order &&
              runtimeType == other.runtimeType &&
              product == other.product;

  @override
  int get hashCode => product.hashCode;
}