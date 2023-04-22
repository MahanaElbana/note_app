import 'package:shared_preferences/shared_preferences.dart';
import 'package:star/core/utils/app_strings.dart';

class LocalStorageSharedPrefs {
  // === get a singleton instance form sharedPreferences ==//
  static late SharedPreferences sharedPreferences;

  Future<void> initialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // ===================================================//
  LocalStorageSharedPrefs._internal();

  factory LocalStorageSharedPrefs() {
    return LocalStorageSharedPrefs._internal();
  }

  // ========== theme functionality ================//
  saveThemeStatus(bool isDark) {
    sharedPreferences.setBool(AppStrings.selectedThemeKey, isDark); 
  }

   bool? get isDak => sharedPreferences.getBool(AppStrings.selectedThemeKey);
}
