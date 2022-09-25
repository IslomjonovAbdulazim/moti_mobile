class Apis {
  Apis._();

  static Apis instance = Apis._();

  ///base url
  String baseUrl = "78.24.219.215:8091";

  ///auth
  String registerAdmin = "/api/v1/auth/add_admin";
  String loginAdmin = "/api/v1/auth/login_admin";
  String loginUser = "/api/v1/auth/login_user";
  String registerUser = "/api/v1/auth/register_user";
  String sendActivationCode = "/api/v1/auth/send_code";
  String verifyUser = "/api/v1/auth/verify_code";
  String allProducts = "/api/v1/product";
  String allCategory = "/api/v1/category/user/page";
}
