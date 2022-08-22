enum EnumOrderTypes {
  COMPLETED,
  ON_GOING,
  CANCELED,
}

class OrderTypes {
  OrderTypes._();

  static OrderTypes instance = OrderTypes._();

  String enumToString(EnumOrderTypes enumOrderTypes) {
    switch(enumOrderTypes) {
      case EnumOrderTypes.COMPLETED: return "Completed order";
      case EnumOrderTypes.ON_GOING: return "Cancel order";
      default: return "Canceled order";
    }
  }
}
