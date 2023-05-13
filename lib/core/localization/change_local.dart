import 'package:ecommercecourse/core/constant/app_theme.dart';
import 'package:ecommercecourse/core/services/servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? langCode = myServices.sharedPreferences.getString("lang");
    if (langCode == "ar") {
      appTheme = themeArabic;
      language = const Locale("ar");
    } else if (langCode == "en") {
      appTheme = themeEnglish;
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = language!.languageCode == "ar" ? themeArabic : themeEnglish;
    }
    super.onInit();
  }
}
