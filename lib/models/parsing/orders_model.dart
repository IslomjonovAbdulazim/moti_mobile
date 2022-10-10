import 'order_model.dart';

class OrdersModel {
  late List<Order> orders;
  late double total;

  OrdersModel({
    required this.orders,
    required this.total,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orders = json["orders"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() => {
    "orders": orders,
    "total": total,
  };
}