import 'package:get/get.dart';
import '../../models/parsing/order_model.dart';
import '../../models/parsing/orders_model.dart';
import '../../models/parsing/product_model.dart';

class OrderController extends GetxController {
  OrdersModel orders = OrdersModel(orders: [], total: 0.0);
  int orderNumber = 0;

  void addToCart(Product product, {int quantity = 1}) {
    double total = quantity * (product.price!-product.price!*product.discount!);
    Order order = Order(product: product, quantity: quantity, total: total);
    if(orders.orders.isNotEmpty) {
      orders.orders.add(order);
      orders.total += order.total;
    } else {
      orders = OrdersModel( orders: [order], total: order.total);
    }

    orderNumber = orders.orders.length;
    update();
  }

  void removeToCart(Product product, {int quantity = 1}) {
    double total = quantity * (product.price!-product.price!*product.discount!);
    Order order = Order(product: product, quantity: quantity, total: total);
    orders.orders.remove(order);
    orders.total -= order.total;

    orderNumber = orders.orders.length;
    update();
  }

  bool checkProduct(Product product) {
    if(orders.orders.isEmpty) return false;

    var list = orders.orders.where((order) => order.product.id == product.id).toList();

    return list.isNotEmpty;
  }

  Order getOrder(Product product) {
    if(orders.orders.isEmpty) return Order(product: product, total: 0.0, quantity: 0);
    Order order = orders.orders.firstWhere((order) => order.product.id == product.id, orElse: () => Order(product: product, total: 0.0, quantity: 0));
    return order;
  }

  void plus(Order order) {
    order.quantity++;
    order.total += (order.product.discount == 0.0 ? order.product.price : order.product.price! - (order.product.price! * order.product.discount!))!;
    orders.total += (order.product.discount == 0.0 ? order.product.price : order.product.price! - (order.product.price! * order.product.discount!))!;
    int index = orders.orders.indexOf(order);
    if(index != -1) {
      orders.orders[index] = order;
    } else {
      orders.orders.add(order);
      orderNumber = orders.orders.length;
    }
    update();
  }

  void minus(Order order) {
    if(order.quantity == 1) {
      removeToCart(order.product);
      orderNumber = orders.orders.length;
      update();
    } else if(order.quantity > 1) {
      order.quantity--;
      order.total -= (order.product.discount == 0.0 ? order.product.price : order.product.price! - (order.product.price! * order.product.discount!))!;
      orders.total -= (order.product.discount == 0.0 ? order.product.price : order.product.price! - (order.product.price! * order.product.discount!))!;
      int index = orders.orders.indexOf(order);
      orders.orders[index] = order;
      update();
    }
  }
}