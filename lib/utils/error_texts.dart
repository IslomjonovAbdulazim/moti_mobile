class ErrorTexts {
  ErrorTexts._();

  static ErrorTexts instance = ErrorTexts._();

  String noEntered(String name) {
    return "$name is required";
  }

  String invalid(String name) {
    return "$name is invalid";
  }
}