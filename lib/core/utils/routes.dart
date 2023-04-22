import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:star/add_note.dart';
import 'package:star/home_page.dart';
import 'package:star/middleware/auth_middleware.dart';
import 'package:star/setting.dart';
import 'package:star/sign_in.dart';
import 'package:star/sign_up.dart';
import 'package:star/verification_email_screen.dart';


class AppRoutes {
  static const String signInScreen = "/";
  static const String signUpScreen = "/SignUp";
  static const String homePageScreen = "/HomePage";
  static const String addNoteScreen = "/AddNote";
  static const String emailVerificationScreen = "/emailVerificationScreen";
  static const String settingsScreenScreen = "/Settings";
}

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.signInScreen, page: () =>  SignIN() , middlewares: [
    AuthMiddleware()
  ]),
  GetPage(name: AppRoutes.signUpScreen, page: () =>  SignUP()),
  GetPage(name: AppRoutes.addNoteScreen, page: () =>  AddNote()),
  GetPage(name: AppRoutes.emailVerificationScreen, page: () =>  EmailVerificationScreen()),
  GetPage(name: AppRoutes.homePageScreen, page: () =>  HomePage()),
  GetPage(name: AppRoutes.settingsScreenScreen, page: () =>  Settings()),
];