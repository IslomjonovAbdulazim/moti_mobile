import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moti/services/apis.dart';
import 'package:moti/services/db_service.dart';
import 'package:moti/services/network_service.dart';
import 'package:moti/utils/colors.dart';
import 'package:moti/utils/dimensions.dart';
import 'package:moti/utils/error_texts.dart';
import 'package:moti/utils/keys.dart';

import '../../models/parsing/token_model.dart';
import '../../models/using/text_field_model.dart';
import '../../utils/masks.dart';

class LetsInController extends GetxController {
  bool isSMSCodeSignUp = false;
  bool isSMSCodeSignIn = false;
  late NetworkService _network;
  late Apis _apis;
  int _currentPageIndex = 0;
  late final PageController pageController;
  late List<TextFieldModel> itemsSignIn;
  late List<TextFieldModel> itemsSignUp;
  late List<TextEditingController> controllersSignIn;
  late List<TextEditingController> controllersSignUp;
  late List<String> hintsSignIn;
  late List<String> hintsSignUp;
  late Masks _masks;
  late DBService _db;
  late Keys _keys;
  final formKey = GlobalKey<FormState>();
  late ErrorTexts _errors;
  bool isValidate = false;
  @override
  void onInit() {
    super.onInit();
    _initFields();
  }

  //getters
  int get getCurrentPageIndex => _currentPageIndex;

  //setters
  set setCurrentPageIndex(int newIndex) {
    _currentPageIndex = newIndex;
    pageController.animateToPage(
      _currentPageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
    update();
  }

  void _validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isValidate = true;
    } else {
      isValidate = false;
    }
    update();
  }

  //to sign in
  Future<bool> doSignUp(String phoneNumber, String name) async {
    _validate();
    if (!isValidate) return false;
    final res = await _network.POST(
      _apis.registerUser,
      {
        "firstName": name,
        "phoneNumber": phoneNumber,
      },
    );
    isSMSCodeSignUp = res != null;
    update();
    return isSMSCodeSignUp;
  }

  Future<bool> doSignIn(String phoneNumber) async {
    print(phoneNumber);
    _validate();
    if (!isValidate) return false;
    final res = await _network.POST(
      _apis.loginUser,
      {"phonenumber": phoneNumber},
      param: {"phonenumber": phoneNumber},
    );
    isSMSCodeSignIn = res != null;

    update();
    return isSMSCodeSignIn;
  }

  //to verify code
  Future<bool?> verifyCode(String phone, String code) async {
    _validate();
    if (!isValidate) return false;
    final res = await _network.GET(
      _apis.baseUrl,
      _apis.verifyUser,
      params: {
        "phone_number": phone,
        "code": code,
      },
    );
    if (res == null) return false;
    final map = jsonDecode(res);
    final parse = TokenModel.fromJson(Map<String, dynamic>.from(map));
    await _db
        .store(_keys.token, parse.body!.data!)
        .then((value) => print('bbbbbbbbbbbbb store: $value'));
    await _db
        .receive(_keys.token)
        .then((value) => print('bbbbbbbbbbbbb get: $value'));
    return true;
  }

  void _initFields() {
    _keys = Keys.instance;
    _db = DBService.instance;
    _network = NetworkService.instance;
    _apis = Apis.instance;
    _errors = ErrorTexts.instance;
    _masks = Masks.instance;
    controllersSignIn = List.generate(
      2,
      (index) => TextEditingController(
          // text: index == 0 ? "998" : null,
          ),
    );
    controllersSignUp = List.generate(
      3,
      (index) => TextEditingController(
          // text: "99",
          ),
    );
    hintsSignIn = [
      "Phone Number",
      "Sms code",
    ];
    pageController = PageController();
    hintsSignUp = [
      "Name",
      "Phone Number",
      "Sms code",
    ];

    itemsSignIn = List.generate(
      controllersSignIn.length,
      (index) => TextFieldModel(
        validator: ((String? res) {
          switch (index) {
            case 0:
              {
                int? phone;
                for (int i = 0; i < (res?.length ?? 0); i++) {
                  if (int.tryParse(res![i]) != null) {
                    phone = 10 * (phone ?? 0) + int.parse(res[i]);
                  }
                }
                print(phone);
                if (phone == null) {
                  return _errors.noEntered("Phone number");
                } else if (phone.toString().length == 12) {
                  return null;
                }
                return _errors.invalid("Phone number");
              }
            case 1:
              {
                if (res?.isEmpty ?? false) {
                  return _errors.noEntered("SMS code");
                } else if (res?.length == 5) {
                  return null;
                }
                return _errors.invalid("SMS code");
              }
          }
          return null;
        }),
        formatters: index == 0
            ? [
                _masks.phoneNumber(),
              ]
            : null,
        controller: controllersSignIn[index],
        hintStyle: TextStyle(
          color: AppColors.instance.mainText,
          fontSize: Dimensions.font16,
        ),
        hintText: hintsSignIn[index],
      ),
    );
    itemsSignUp = List.generate(
      controllersSignUp.length,
      (index) => TextFieldModel(
        validator: ((String? res) {
          switch (index) {
            case 0:
              {
                if (res?.isEmpty ?? false) {
                  return _errors.noEntered("Name");
                } else if (res?.length == 9) {
                  return null;
                }
                return _errors.invalid("Name");
              }
            case 1:
              {
                int? phone;
                for (int i = 0; i < (res?.length ?? 0); i++) {
                  if (int.tryParse(res![i]) != null) {
                    phone = 10 * (phone ?? 0) + int.parse(res[i]);
                  }
                }
                if (phone == null) {
                  return _errors.noEntered("Phone number");
                } else if (phone.toString().length == 12) {
                  return null;
                }
                return _errors.invalid("Phone number");
              }
            case 2:
              {
                if (res?.isEmpty ?? false) {
                  return _errors.noEntered("SMS code");
                } else if (res?.length == 5) {
                  return null;
                }
                return _errors.invalid("SMS code");
              }
          }
          return null;
        }),
        formatters: index == 1
            ? [
                _masks.phoneNumber(),
              ]
            : null,
        controller: controllersSignUp[index],
        hintStyle: TextStyle(
          color: AppColors.instance.mainText,
          fontSize: Dimensions.font16,
        ),
        hintText: hintsSignUp[index],
      ),
    );
  }
}
