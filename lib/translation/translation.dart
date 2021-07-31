import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Localization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          //////////// **  Sign In  ** /////////////////
          "SU": "Sign Up",
          "SI": "Sign In",
          "EYE": "Enter your email ",
          "E": "Email",
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
