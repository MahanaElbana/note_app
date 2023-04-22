import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Localization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          //////////// **  Sign In  ** /////////////////
          AppLanguageStrings.signUpString: "Sign Up",
          AppLanguageStrings.signInString: "Sign In",
          AppLanguageStrings.enterYourEmailString: "Enter your email ",
          AppLanguageStrings.emailString: "Email",
          "EYP": "Enter your password ",
          "P": "Password",
          "Sh": "show",
          "Hd": "hide",
          "DNYHAA": "Do not you have an Account ? ",
          "OR": "- OR -",
          "SIW": "Sign in with",
          "LO": "LOGIN",
          //////////// **  Sign Up ** /////////////////
          "EYN": "Enter your name ",
          "NE": "Name",
          "EYPh": "Enter your Phone ",
          "Ph": "Phone",
          "DYHAA": "Do you have an Account ? ",
          //////////// **  Home Page ** /////////////////
          "HP": "Home Page",
          "LOu": "Log out",
          "NIA": "No items added !",
          "ADD": "Add",
          //////////// **  LightTheme ** /////////////////
          "LT": "Light theme",
          "DT": "Dark theme",
          "CL": "Change Language",
          "S": "Settings",
          "AU": "About Us",
          "FB": "facebook",
          "SM": "send me",
          "GAVFU": "give a value for us ",
          //////////// **  Add Note ** /////////////////
          "AN": "Add note",
          "T": "Title",
          "EYT": "Enter Your Title",
          "C": "Content",
          "EYC": "Enter your content",
          "Sv": "Save",
          "Up": "Update Note"
        },
        'ar': {
          //////////// **  تسجبل الدخول  ** /////////////////
          "SU": "انشاء حساب ",
          "SI": "تسجيل الدخول ",
          "EYE": "ادخل ايميلك",
          "E": "الايميل",
          "EYP": "ادخل الباسورد الخاص بك",
          "P": "الباسورد",
          "Sh": "اظهر",
          "Hd": "اخفى",
          "DNYHAA": "ليس لديك حساب ؟",
          "OR": "- او  -",
          "SIW": "تسجيل الدخول بواسطه",
          "LO": "سجل دخول",
          //////////// **  Sign Up ** /////////////////
          "EYN": "ادخل اسمك",
          "NE": "الاسم",
          "EYPh": "ادخل رقم الموبيل",
          "Ph": "الموبيل",
          "DYHAA": "هل لديك حساب ؟",
          //////////// **  Home Page ** /////////////////
          "HP": "الصفحه الرئسيه",
          "LOu": "تسجيل الخروج",
          "NIA": "لايوجد اي ملاحظات مضافه",
          "ADD": "اضافه",
          //////////// **  LightTheme ** /////////////////
          "LT": "الوضع الشمسي",
          "DT": "الوضع اليلي ",
          "CL": "تغير اللغه",
          "S": "الاعدادات",
          "AU": "اتصل بنا ",
          "FB": "الفيس بوك",
          "SM": "ارسل الينا",
          "GAVFU": "قيمنا",
          //////////// **  Add Note ** /////////////////
          "AN": "اضافه ملاحظه",
          "T": "العنوان",
          "EYT": "ادخل العنوان",
          "C": "المحتوي",
          "EYC": "ادخل المحتوي",
          "Sv": "احفظ",
          "Up": "تعديل"
        },
      };
}

/////////////////  Language Controller    ////////////////////////
class LanguageController extends GetxController {
  var lang = "ar".obs;

  void changeLanguage(String code) {
    var local = Locale(code);
    Get.updateLocale(local);
  }
}

class AppLanguageStrings {
  static const String arabicLanguage = "ar";
  static const String englishLanguage = "en";

  static const String signUpString = "signUpString";
  static const String signInString = "signInString";
  static const String enterYourEmailString = "enterYourEmailString";
  static const String emailString = "emailString";
  static const String enterYourPasswordString = "enterYourPasswordString"; 
  // static const String englishLanguage = "P": "Password",
  // static const String englishLanguage = "Sh": "show",
  // static const String englishLanguage = "Hd": "hide",
  // static const String englishLanguage = "DNYHAA": "Do not you have an Account ? ",
  // static const String englishLanguage = "OR": "- OR -",
  // static const String englishLanguage = "SIW": "Sign in with",
  // static const String englishLanguage = "LO": "LOGIN",
  // static const String englishLanguage = //////////// **  Sign Up ** /////////////////
  // static const String englishLanguage = "EYN": "Enter your name ",
  // static const String englishLanguage = "NE": "Name",
  // static const String englishLanguage = "EYPh": "Enter your Phone ",
  // static const String englishLanguage = "Ph": "Phone",
  // static const String englishLanguage = "DYHAA": "Do you have an Account ? ",
  // static const String englishLanguage = //////////// **  Home Page ** /////////////////
  // static const String englishLanguage = "HP": "Home Page",
  // static const String englishLanguage = "LOu": "Log out",
  // static const String englishLanguage = "NIA": "No items added !",
  // static const String englishLanguage = "ADD": "Add",
  // static const String englishLanguage = //////////// **  LightTheme ** /////////////////
  // static const String englishLanguage = "LT": "Light theme",
  // static const String englishLanguage = "DT": "Dark theme",
  // static const String englishLanguage = "CL": "Change Language",
  // static const String englishLanguage = "S": "Settings",
  // static const String englishLanguage = "AU": "About Us",
  // static const String englishLanguage = "FB": "facebook",
  // static const String englishLanguage = "SM": "send me",
  // static const String englishLanguage = "GAVFU": "give a value for us ",
  // static const String englishLanguage = //////////// **  Add Note ** /////////////////
  // static const String englishLanguage = "AN": "Add note",
  // static const String englishLanguage = "T": "Title",
  // static const String englishLanguage = "EYT": "Enter Your Title",
  // static const String englishLanguage = "C": "Content",
  // static const String englishLanguage = "EYC": "Enter your content",
  // static const String englishLanguage = "Sv": "Save",
  // static const String englishLanguage = "Up": "Update Note"
}
