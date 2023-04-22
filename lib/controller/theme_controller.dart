import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:star/data/shared_preferences/shared_pref.dart';

class ThemeController extends GetxController {
  bool _isDark = LocalStorageSharedPrefs().isDak ?? false;
  bool get isDark => _isDark;

  changeAppTheme() {
    Get.changeTheme(isDark ? ThemeData.light() : ThemeData.dark()); // from GetX
    _isDark = !isDark;
    LocalStorageSharedPrefs().saveThemeStatus(_isDark);
    update();
  }
}
