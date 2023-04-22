import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:star/controller/theme_controller.dart';
import 'package:star/core/config/theme.dart';
import 'package:star/core/utils/app_strings.dart';

import '../core/utils/routes.dart';
import '../translation/translation.dart';

class NoteApp extends StatelessWidget {
  //========== singleton ===============//
  const NoteApp._internal();
  static const NoteApp instance = NoteApp._internal();
  factory NoteApp() {
    return instance;
  }
  //===================================//
  @override
  Widget build(BuildContext context) {
    Get.changeTheme(
        ThemeController().isDark ? ThemeData.dark() : ThemeData.light());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(AppStrings.localLanguage),
      fallbackLocale: Locale(AppStrings.localLanguage),
      translations: Localization(),
      title: AppStrings.noteApp,
      theme: Style.lightTheme,
      darkTheme: Style.darkTheme,
      getPages: routes,
      initialRoute:  AppRoutes.signInScreen,
    );
  }
}
