import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:star/add_note.dart';
import 'package:star/core/utils/app_enums.dart';

import 'package:star/setting.dart';

import 'package:star/sign_in.dart';
import 'package:star/sign_up.dart';
import 'package:star/translation/translation.dart';
import 'package:star/verification_email_screen.dart';

import 'home_page.dart';

AppAuthEnum loginStatus = AppAuthEnum.isNotLogined;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCaIfSzGR9F3AWt0qnCdIyRbuvLMn4ex-I",
          projectId: "noteapp-f4afc",
          messagingSenderId: "89427593115",
          appId: "1:89427593115:web:f95e879413d9c19da6833e"));

  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    loginStatus = AppAuthEnum.isNotLogined;
  } else if (!user.emailVerified) {
    loginStatus = AppAuthEnum.isLoginedWithOutVerfication;
  } else {
    loginStatus = AppAuthEnum.isLoginedWithVerfication;
  }
  print(user?.email);
  print(user?.emailVerified);
  runApp(MyApp());
  print(loginStatus);
}

class MyApp extends StatelessWidget {
  // --------------------------------------//
  String initialRoute(AppAuthEnum loginStatus) {
    if (loginStatus == AppAuthEnum.isNotLogined) {
      return "SignIn";
    } else if (loginStatus == AppAuthEnum.isLoginedWithOutVerfication) {
      return "Verfication";
    } else {
      return "HomePage";
    }
  }

  //--------------------------------------//
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      translations: Localization(),

      debugShowCheckedModeBanner: false,
      title: "NoteApp",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //  home: VerficationEmailScreen(),
      // initialRoute: initialRoute(loginStatus),
      initialRoute: loginStatus == AppAuthEnum.isNotLogined
          ? "SignIn"
          : (loginStatus == AppAuthEnum.isLoginedWithOutVerfication
              ? 'Verfication'
              : "HomePage"),
      routes: {
        "SignUp": (BuildContext context) => SignUP(),
        "SignIn": (BuildContext context) => SignIN(),
        "HomePage": (BuildContext context) => HomePage(),
        "AddNote": (BuildContext context) => AddNote(),
        "Settings": (BuildContext context) => Settings(),
        "Verfication": (BuildContext context) => VerficationEmailScreen(),
      },
    );
  }
}
