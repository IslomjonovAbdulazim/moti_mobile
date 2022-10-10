import 'dart:ui';
import 'package:get/get.dart';

class LangService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'search': 'Search',
      'add to cart': 'Add to cart',
      'total': 'Total:',
      'checkout': 'Checkout',
      'delivery': 'Delivery',
      'pickup': 'Pick Up',
      'district': 'District',
      'street': 'street',
      'home': 'Home',
      'entrance': 'Entrance',
      'floor': 'Floor',
      'comments': 'Comments',
      'home number': 'Home number',
      'on time': 'On Time',
      'next': 'Next',
      'cash': 'Cash',
      'terminal': 'Terminal',
      'payme': 'Payme',
      'apelsin': 'Apelsin',
      'click': 'Click',
      'history': 'History',
      'favorite': 'Favorite',
      'cancel order': 'Cancel Order',
      'completed order': 'Completed Order',
      'profile': 'Profile',
      'language': 'Language',
      'call to operator': 'Call to operator',
      'about': 'About',
      'sign in': 'Sign in',
      'sign up': 'Sign up',
      'phone number': 'Phone number',
      'sms code': 'SMS code',
      'name': 'Name',
      'confirm': 'Confirm',
      'cart': 'Cart',
      'payment info': 'Payment Info',

    },
    'ru_RU': {
      'search': 'Поиск',
      'add to cart': 'Добавить в корзину',
      'total': 'Итого:',
      'checkout': 'Проверить',
      'delivery': 'Доставка',
      'pickup': 'Самовынос',
      'district': 'Район',
      'street': 'Улица',
      'home': 'Дом',
      'entrance': 'Подъезд ',
      'floor': 'Этаж',
      'comments': 'Комментарии',
      'home number': 'Номер дома',
      'on time': 'На время',
      'next': 'Следующий',
      'cash': 'Наличные',
      'terminal': 'Терминал',
      'payme': 'Пейми',
      'apelsin': 'Апельсин',
      'click': 'Клик',
      'history': 'История',
      'favorite': 'Любимые',
      'cancel order': 'Отменить заказ',
      'completed order': 'Завершенный заказ',
      'profile': 'Профиль',
      'language': 'Язык',
      'call to operator': 'Звонок оператору',
      'about': 'О приложении',
      'sign in': 'Войти',
      'sign up': 'Зарегистрироваться',
      'phone number': 'Номер телефона',
      'sms code': 'СМС код',
      'name': 'Имя',
      'confirm': 'Подтверждать',
      'cart': 'Корзина',
      'payment info': 'Платежная информация',


    },
    'uz_UZ': {
      'search': 'Qidirish',
      'add to cart': 'Savatga qo`shish',
      'total': 'Jami:',
      'checkout': 'Buyurtmani rasmiylashtirish',
      'delivery': 'Yetkazib berish',
      'pickup': 'Termoq',
      'district': 'Tuman',
      'street': 'Ko`cha',
      'home': 'Uy',
      'entrance': 'Entrance',
      'floor': 'Qavat',
      'comments': 'Kommentlar',
      'home number': 'Uy raqami',
      'on time': 'Vaqt bo`yicha',
      'next': 'Keyingisi',
      'cash': 'Naxt',
      'terminal': 'Terminal',
      'payme': 'Payme',
      'apelsin': 'Apelsin',
      'click': 'Click',
      'history': 'Buyurtmalar tarixi',
      'favorite': 'Sevimlilar',
      'cancel order': 'Buyurtmani bekor qilish',
      'completed order': 'Tugallangan buyurtma',
      'profile': 'Profil',
      'language': 'Til',
      'call to operator': 'operator bilan bog`lanish',
      'about': 'Ilova xaqida',
      'sign in': 'Tizimga kirish',
      'sign up': 'Ro`yxatdan o`tish',
      'phone number': 'Telefon raqami',
      'sms code': 'SMS kod',
      'name': 'Ismi',
      'confirm': 'Buyurtmani tasdiqlash',
      'cart': 'Savatcha',
      'payment info': 'To`lov ma`lumotlari',
    },
  };

  static const fallbackLocale = Locale('uz', 'UZ');

  static final items = [
    'English',
    'Русский',
    'O\'zbekcha',
  ];

  static final langs = [
    'en',
    'ru',
    'uz',
  ];

  static final List<Locale> locales = [
    const Locale('en', 'US'),
    const Locale('ru', 'RU'),
    const Locale('uz', 'UZ'),
  ];

  static final locale = defLanguage(
     // DBService.to.getData<String>(StorageKeys.language) ??
          LangService.langs[0]);

  static Locale defLanguage(String code) {
    var index = langs.indexOf(code);
    return locales[index];
  }

  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
      //DBService.to.setData<String>(StorageKeys.language, lang);
    }
  }

  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }
}
