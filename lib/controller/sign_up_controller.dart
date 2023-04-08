import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:star/core/error/failure.dart';
import 'package:star/data/firebase/firebase_auth.dart';
import 'package:star/sign_in.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  bool checkDataForm(
    {
    required String username,
    required String password,
    required String email,
    required String phone,
  }
  );
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  //===============================================//
  bool isSignUpOperationIsRunning = false;
  changeSignUpStatus() {
    isSignUpOperationIsRunning = !isSignUpOperationIsRunning;
    update();
  }
  //==============================================//

  UserCredential? userCredential;

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  Future<Either<Failure, Enum>> signUp() async {
    FormState? formdata = formstate.currentState;

    var returnedstatusOrError = await FirebaseAuthDataSource.signUp(
      email: email.text,
      password: password.text,
      phone: phone.text,
      userName: username.text,
    );
    // print(
    //   returnedstatusOrError,
    // );
    return returnedstatusOrError;
  }

  @override
  goToSignIn() {
    Get.off(SignIN());
  }


  @override
 bool checkDataForm({
    required String username,
    required String password,
    required String email,
    required String phone,
  })  {
    if (username.length > 2 &&
        email.length > 8 &&
        password.length > 6 &&
        phone.length == 11) {
      return true;
    } else
      return false; 
  }
  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
  


}
