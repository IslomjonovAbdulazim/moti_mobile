class FavouritesModel {
  FavouritesModel({
    this.headers,
    this.body,
    this.statusCode,
    this.statusCodeValue,
  });

  FavouritesModel.fromJson(Map<String, dynamic> json) {
    headers = json['headers'];
    if (json['body'] != null) {
      body = [];
      json['body'].forEach((v) {
        body?.add(Body.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
    statusCodeValue = json['statusCodeValue'];
  }

  Map? headers;
  List<Body>? body;
  String? statusCode;
  int? statusCodeValue;

  FavouritesModel copyWith({
    dynamic headers,
    List<Body>? body,
    String? statusCode,
    int? statusCodeValue,
  }) =>
      FavouritesModel(
        headers: headers ?? this.headers,
        body: body ?? this.body,
        statusCode: statusCode ?? this.statusCode,
        statusCodeValue: statusCodeValue ?? this.statusCodeValue,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['headers'] = headers;
    if (body != null) {
      map['body'] = body?.map((v) => v.toJson()).toList();
    }
    map['statusCode'] = statusCode;
    map['statusCodeValue'] = statusCodeValue;
    return map;
  }
}

class Body {
  Body({
    this.id,
    this.productName,
    this.categoryId,
    this.categoryName,
    this.description,
    this.price,
    this.imageUrl,
    this.discount,
    this.readyTime,
    this.favourite,
  });

  Body.fromJson(dynamic json) {
    id = json['id'];
    productName = json['productName'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    discount = json['discount'];
    readyTime = json['readyTime'];
    favourite = json['favourite'];
  }

  int? id;
  String? productName;
  int? categoryId;
  String? categoryName;
  String? description;
  double? price;
  String? imageUrl;
  double? discount;
  String? readyTime;
  bool? favourite;

  Body copyWith({
    int? id,
    String? productName,
    int? categoryId,
    String? categoryName,
    String? description,
    double? price,
    String? imageUrl,
    double? discount,
    String? readyTime,
    bool? favourite,
  }) =>
      Body(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        description: description ?? this.description,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        discount: discount ?? this.discount,
        readyTime: readyTime ?? this.readyTime,
        favourite: favourite ?? this.favourite,
      );

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
    map['readyTime'] = readyTime;
    map['favourite'] = favourite;
    return map;
  }
}
