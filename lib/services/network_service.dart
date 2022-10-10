import 'dart:convert';

import 'package:http/http.dart';
import 'package:moti/services/apis.dart';

class NetworkService {
  final apis = Apis.instance;
  NetworkService._();

  static final instance = NetworkService._();
  String BASEURL = "drogrammer.uz";

  Map<String, String> get headers {
    return {
      'Content-type': 'application/json; charset=UTF-8',
      'hl' : 'ru'
    };
  }


  Map<String, String> headersWithToken(String token) {
    return {
      'Authorization': token,
    };
  }

  Future<String?> GET(String baseUrl, String api,
      {Map<String, String>? params}) async {
    Uri url = Uri.http(baseUrl, api, params);
    print(url);
    Response response = await get(url, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return const Utf8Decoder().convert(response.body.codeUnits);
    }

    return null;
  }

  Future<Response?> POST(String api, Map<String, dynamic>? body, {Map<String, dynamic>? param}) async {
    // print(param);
    String a = (param != null? "?$param": "");
    print(api+a);
    Uri url = Uri.http(apis.baseUrl, api,param);
    print('url: $url');
    Response response =
        await post(url, headers: headers, body: jsonEncode(body));
print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    }

    return null;
  }

  Future<String?> PUT(
      String baseUrl, String api, Map<String, dynamic>? body) async {
    Uri url = Uri.https(baseUrl, api);
    Response response =
        await put(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }

    return null;
  }

  Future<String?> DELETE(String baseUrl, String api,
      {Map<String, String>? params}) async {
    Uri url = Uri.https(baseUrl, api, params);
    Response response = await delete(url, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }

    return null;
  }
}
