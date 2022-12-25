import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:star/add_note.dart';


import 'package:star/setting.dart';

import 'package:star/sign_in.dart';
import 'package:star/sign_up.dart';
import 'package:star/translation/translation.dart';

import 'home_page.dart';

bool islogin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  print(user?.email);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      //home: SignUP(),
      initialRoute: islogin ? "HomePage" : "SignIn",
      routes: {
        "SignUp": (BuildContext context) => SignUP(),
        "SignIn": (BuildContext context) => SignIN(),
        "HomePage": (BuildContext context) => HomePage(),
        "AddNote": (BuildContext context) => AddNote(),
        "Settings": (BuildContext context) => Settings(),
      },
    );
  }
}
