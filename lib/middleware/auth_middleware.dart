import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../core/utils/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const RouteSettings(name: AppRoutes.signInScreen);
    } else {
      if (!user.emailVerified) {
        return const RouteSettings(name: AppRoutes.emailVerificationScreen);
      }
      return const RouteSettings(name: AppRoutes.homePageScreen);
    }
  }
}
