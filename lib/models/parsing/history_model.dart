class HistoryModel {
  HistoryModel({
    this.id,
    this.deliveryTime,
    this.payType,
    this.address,
    this.products,
    this.price,
    this.status,
    this.orderType,
    this.comments,
    this.user,
  });

  HistoryModel.fromJson(dynamic json) {
    id = json['id'];
    deliveryTime = json['deliveryTime'];
    payType = json['payType'];
    address = json['address'];
    // if (json['products'] != null) { todo
    //   products = [];
    //   json['products'].forEach((v) {
    //     products?.add(Dynamic.fromJson(v));
    //   });
    // }
    price = json['price'];
    status = json['status'];
    orderType = json['orderType'];
    comments = json['comments'];
    user = json['user'];
  }

  int? id;
  int? deliveryTime;
  String? payType;
  String? address;
  List<dynamic>? products;
  double? price;
  String? status;
  dynamic orderType;
  String? comments;
  String? user;

  HistoryModel copyWith({
    int? id,
    int? deliveryTime,
    String? payType,
    String? address,
    List<dynamic>? products,
    double? price,
    String? status,
    dynamic orderType,
    String? comments,
    String? user,
  }) =>
      HistoryModel(
        id: id ?? this.id,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        payType: payType ?? this.payType,
        address: address ?? this.address,
        products: products ?? this.products,
        price: price ?? this.price,
        status: status ?? this.status,
        orderType: orderType ?? this.orderType,
        comments: comments ?? this.comments,
        user: user ?? this.user,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['deliveryTime'] = deliveryTime;
    map['payType'] = payType;
    map['address'] = address;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['price'] = price;
    map['status'] = status;
    map['orderType'] = orderType;
    map['comments'] = comments;
    map['user'] = user;
    return map;
  }
}
