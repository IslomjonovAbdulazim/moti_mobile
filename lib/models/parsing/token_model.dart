import 'dart:convert';
TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));
String tokenModelToJson(TokenModel data) => json.encode(data.toJson());
class TokenModel {
  TokenModel({
      this.headers, 
      this.body, 
      this.statusCode, 
      this.statusCodeValue,});

  TokenModel.fromJson(Map<String, dynamic> json) {
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
      this.message, 
      this.statusCode, 
      this.data,});

  Body.fromJson(dynamic json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'];
  }
  String? message;
  int? statusCode;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusCode'] = statusCode;
    map['data'] = data;
    return map;
  }

}