import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService{
  static const BASEURL = "78.24.219.215:8091";
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    // 'Authorization': 'Client-ID 7abE06yGKJfCKMMI93kyIdtx5MTc_6sZ3hvuQC4vtro',
  };
  static const API_LIST_PHOTOS = "/photos";

  static const String API_GET_ALL_IMAGES = "/photos";
  static const String API_GET_ALL_PRODUCTS = "/api/v1/product";
  static const String API_GET_All_CATEGORY_PRODUCT = "/api/v1/category/user/page";
  static const String API_SEARCH_PHOTO = "/search/photos";
    static const String API_SEARCH_COLLECTIONS = "/search/collections";
  static const String API_LIST_COLLECTIONS = "/collections";
  static const String API_SEARCH_USER = "/search/users";
  static const String API_GET_A_RANDOM_PHOTO = "/photos/random";
  static const String _apiToGetUserProfile = "/users/";

  // static String API_GET_A_PHOTO(String index, String type) {
  //   return '$API_GET_ALL_IMAGES/$index/$type';
  // }
  //
  // static String API_GET_USER_PROFILE(String username) {
  //   return '$_apiToGetUserProfile$username';
  // }
  //
  // static String API_GET_USER_S(String username, String type) {
  //   return "/users/$username/$type";
  // }
  //
  // static String API_TO_SEARCH(String type) {
  //   return API_SEARCH_PHOTO + type;
  // }
  //
  // static String API_TO_GET_USER_PORFOLIO_LINK(String username) {
  //   return '$_apiToGetUserProfile$username/portfolio';
  // }




  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.http(BASEURL, api, params);
    http.Response? response = await http.get(uri, headers: headers);
    print(response.statusCode);
    if (response.statusCode != 200) {
      return null;
    }

    return response.body;
  }
  static Future<String?> POST(String api,  Map<String, dynamic> body,Map<String, String> params,) async{
    Uri url = Uri.https(BASEURL, api, params);
    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    print(response.statusCode);
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }
  static Future<String?> DELETE(String api, Map<String, String> params) async{
    Uri url = Uri.https(BASEURL, api, params);
    final response = await http.delete(url, headers: headers);
    print(response.statusCode);
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }
  static Map<String, String> paramToSearchPhoto({
    required query,
    int page = 1,
    int perPage = 10,
    String orderBy = 'relevant',
    String contentFilter = 'low',
    String orientation = 'portrait',
  }) {
    return {
      'query': query,
      'page': '$page',
      'per_page': '$perPage',
      'order_by': orderBy,
      'content_filter': contentFilter,
      'orientation': orientation,
    };
  }
    static const Map<String, String> paramsEmpty = {};
  static Map<String, String> paramToGetUserSLikedPhotos({
    int page = 1,
    int perPage = 10,
    String orderBy = 'latest',
    String orientation = 'landscape',
  }) {
    return {
      "page": page.toString(),
      "per_page": perPage.toString(),
      "order_by": orderBy,
      "orientation": orientation,
    };
  }

  static Map<String, String> paramToGetUserSCollections({
    int page = 1,
    int perPage = 10,
  }) {
    return {
      "page": page.toString(),
      "per_page": perPage.toString(),
    };
  }

  static Map<String, String> paramToGetImages({
    int page = 1,
    int perPage = 15,
    String orderBy = 'latest',
  }) {
    return {
      'page': '$page',
      'per_page': '$perPage',
      'order_by': orderBy,
    };
  }

  static Map<String, String> paramToGetUserSStatistics({
    String resolution = 'days',
    int quantity = 30,
  }) {
    return {
      "resolution": resolution,
      "quantity": quantity.toString(),
    };
  }

  static Map<String, String> paramToSearchCollectionOrUsers({
    required String query,
    int page = 1,
    int perPage = 10,
  }) {
    return {
      'query': query,
      'page': '$page',
      'per_page': '$perPage',
    };
  }

  static Map<String, String> paramToGetUsersProfile(String username) {
    return {"username": username};
  }

}