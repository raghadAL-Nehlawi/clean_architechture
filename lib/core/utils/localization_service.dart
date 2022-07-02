import 'dart:ui';
import 'package:get/get.dart' as g;
import 'package:get/get.dart';
import 'lang/ar.dart';
import 'lang/en_US.dart';

class LocalizationService extends g.Translations {

  static get locale {
    //String lan = StorageController().langName;
    String lan = 'en';
    return getLocaleFromLanguage(lan);
  }

  static final fallbackLocale = Locale('en', 'US');

  static final langs = [
    'English',
    'Arabic',
  ];

  static final locales = [
    Locale('en', 'US'),
    Locale('ar', 'KW'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'ar_KW': ar_KW,
      };

  static void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);
    g.Get.updateLocale(locale!);
    //TODO
    //StorageController().lang = lang;
  }

  static Locale getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return  Locale('en', 'US');
  }

}
