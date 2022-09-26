import 'dart:convert';
TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));
String tokenModelToJson(TokenModel data) => json.encode(data.toJson());
class TokenModel {
  TokenModel({
      this.headers, 
      this.body, 
      this.statusCode, 
      this.statusCodeValue,});

  TokenModel.fromJson(dynamic json) {
    headers = json['headers'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
    statusCode = json['statusCode'];
    statusCodeValue = json['statusCodeValue'];
  }
  dynamic headers;
  Body? body;
  String? statusCode;
  int? statusCodeValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['headers'] = headers;
    if (body != null) {
      map['body'] = body?.toJson();
    }
    map['statusCode'] = statusCode;
    map['statusCodeValue'] = statusCodeValue;
    return map;
  }

}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      this.id, 
      this.token,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    token = json['token'];
  }
  int? id;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['token'] = token;
    return map;
  }

}