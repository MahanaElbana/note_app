import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:star/component/alert.dart';
import 'package:star/core/utils/app_enums.dart';
import 'package:star/model/user_model.dart';
import 'package:star/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  /////////////                ////////////////
  bool enable = false;
  void togleObscure() {
    if (enable == false) {
      setState(() {
        enable = true;
      });
    } else {
      setState(() {
        enable = false;
      });
    }
  }

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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";
  String phone = "";

  // ======================================//
  UserCredential? _userCredential;
  /////////////             ////////////////
  int color1 = Color(0xff4d94ff).value;
  int color2 = Color(0xff0052cc).value;
  SharedPreferences? _prefs;
  void getDataColor() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      color1 = _prefs!.getInt("c1") ?? Color(0xff4d94ff).value;
      color2 = _prefs!.getInt("c2") ?? Color(0xff0052cc).value;
    });
  }

  @override
  void initState() {
    getDataColor();
    super.initState();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar( ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(color1),
            Color(color2),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ////////////////////////////////
              Text(
                "SU".tr,
                style: styleFunc(fontsize: 30, color: AppColors.kWhiteColor),
              ),
              SizedBox(
                height: 40.0,
              ),
              ////////////////////////////////
              ////////////    TextField     ////////////
              CircleAvatar(
                backgroundColor: AppColors.kWhiteColor,
                radius: 60.0,
                child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.photoVideo,
                    color: AppColors.kGrayColor,
                  ),
                ),
              ),
              /////// /////// //////
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                  /////    decoration: InputDecoration  /////
                  decoration: InputDecoration(
                    hintText: "EYN".tr,
                    hintStyle: styleFunc(color: AppColors.kGrayColor),
                    labelText: "NE".tr,
                    labelStyle: styleFunc(color: AppColors.kWhiteColor),
                    prefixIcon:
                        Icon(Icons.person, color: AppColors.kWhiteColor),

                    /////   enabledBorder enabled start shape////
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    /////   enabledBorder ////

                    ////////   focusedBorder at writting  ////
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: AppColors.kWhiteColor, width: 1.0),
                    ),
                    ////////   focusedBorder ////
                  ),
                  /////////     decoration: InputDecoration   ////////
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  cursorColor: AppColors.kWhiteColor,
                  cursorHeight: 27.0,
                  cursorRadius: Radius.circular(15.0),
                  cursorWidth: 4.0,
                  showCursor: true,
                  //obscureText: enable,
                  autocorrect: true,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                  /////    decoration: InputDecoration  /////
                  decoration: InputDecoration(
                    hintText: "EYE".tr,
                    hintStyle: styleFunc(color: AppColors.kGrayColor),
                    labelText: "E".tr,
                    labelStyle: styleFunc(color: AppColors.kWhiteColor),
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColors.kWhiteColor,
                    ),

                    /////   enabledBorder enabled start shape////
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    /////   enabledBorder ////

                    ////////   focusedBorder at writting  ////
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: AppColors.kWhiteColor, width: 1.0),
                    ),
                    ////////   focusedBorder ////
                  ),
                  /////////     decoration: InputDecoration   ////////
                  controller: _emailController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.white,
                  cursorHeight: 27.0,
                  cursorRadius: Radius.circular(15.0),
                  cursorWidth: 4.0,
                  showCursor: true,
                  obscureText: enable,
                  autocorrect: true,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                  /////    decoration: InputDecoration  /////
                  decoration: InputDecoration(
                    hintText: "EYPh".tr,
                    hintStyle: styleFunc(color: AppColors.kGrayColor),
                    labelText: "Ph".tr,
                    labelStyle: styleFunc(color: AppColors.kWhiteColor),
                    prefixIcon: Icon(
                      Icons.phone_android_rounded,
                      color: AppColors.kWhiteColor,
                    ),

                    /////   enabledBorder enabled start shape////
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    /////   enabledBorder ////

                    ////////   focusedBorder at writting  ////
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: AppColors.kWhiteColor, width: 1.0),
                    ),
                    ////////   focusedBorder ////
                  ),
                  /////////     decoration: InputDecoration   ////////
                  controller: _phoneController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.white,
                  cursorHeight: 27.0,
                  cursorRadius: Radius.circular(15.0),
                  cursorWidth: 4.0,
                  showCursor: true,
                  obscureText: enable,
                  autocorrect: true,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                  /////    decoration: InputDecoration  /////
                  decoration: InputDecoration(
                    hintText: "EYP".tr,
                    hintStyle: styleFunc(color: AppColors.kGrayColor),
                    labelText: "P".tr,
                    labelStyle: styleFunc(color: AppColors.kWhiteColor),
                    prefixIcon: Icon(
                      Icons.lock_clock_outlined,
                      color: AppColors.kWhiteColor,
                    ),

                    /////   enabledBorder enabled start shape////
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1.0),
                    ),
                    /////   enabledBorder ////

                    ////////   focusedBorder at writting  ////
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: AppColors.kWhiteColor, width: 1.0),
                    ),
                    ////////   focusedBorder ////

                    suffixIcon: IconButton(
                      icon: enable
                          ? Icon(Icons.visibility_off_outlined,
                              color: AppColors.kGrayColor)
                          : Icon(Icons.visibility_outlined,
                              color: AppColors.kWhiteColor),
                      onPressed: togleObscure,
                    ),

                    suffix: enable
                        ? Text("Sh".tr,
                            style: TextStyle(color: AppColors.kGrayColor))
                        : Text("Hd".tr,
                            style: TextStyle(color: AppColors.kWhiteColor)),
                  ),
                  /////////     decoration: InputDecoration   ////////
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.white,
                  cursorHeight: 27.0,
                  cursorRadius: Radius.circular(15.0),
                  cursorWidth: 4.0,
                  showCursor: true,
                  obscureText: enable,
                  autocorrect: true,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 60.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Text(
                              "DYHAA".tr,
                              style: styleFunc(
                                  color: AppColors.kGrayColor, fontsize: 20.0),
                            ),
                            GestureDetector(
                              child: Text(
                                "SI".tr,
                                style: styleFunc(
                                    color: AppColors.kWhiteColor,
                                    fontsize: 27.0),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return SignIN();
                                  },
                                ));
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //////////////////////
              SizedBox(
                height: 15.0,
              ),
              ////////////    TextField     ////////////
              /// ////////   TextButton  ////
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextButton(
                  child: Text(
                    "SU".tr,
                    style: styleFunc(color: Color(0xff002699), fontsize: 25.0),
                  ),
                  onPressed: () async {
                    if (_nameController.text.length > 2 &&
                        _emailController.text.length > 8 &&
                        _passwordController.text.length > 6 &&
                        _phoneController.text.length == 11) {
                      setState(() {
                        name = _nameController.text;
                        password = _passwordController.text;
                        email = _emailController.text;
                        phone = _phoneController.text;
                      });
                      // ------------------------------ --- signUP   -----------------------------//
                      try {
                        showdialog(context);
                        _userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: this.email, password: this.password);
                        String userId = _userCredential!.user!.uid;
                        UserModel userModel = UserModel(
                            id: userId,
                            userName: _nameController.text.toString().trim(),
                            password:  _passwordController.text.toString().trim(),
                            phone:  _phoneController.text.toString().trim(),
                            email: _emailController.text.toString().trim() ,);
                        if (_userCredential != null) {
                          await FirebaseFirestore.instance
                              .collection("user")
                              .doc(userId)
                              .set(userModel.toJsonData());
                        }
                        /////////////// ************ //////////////////
                        print(_userCredential?.user?.uid);
                        Navigator.of(context).pushReplacementNamed("HomePage");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "email-already-in-use") {
                          //////////////////
                          Navigator.pop(context);
                          ///////////////////////
                          print("the email address is used by an0ther one");
                        } else if (e.code == "weak-password") {
                          //////////////////
                          Navigator.pop(context);
                          ///////////////////////
                          print("password should be at least 6 characters");
                        }
                      } catch (e) {
                        print(e);
                      }

                      //// signUP  ///
                    } else {
                      //////////////////
                      Navigator.pop(context);
                      ///////////////////////
                      print("e");
                      // AwesomeDialog(
                      //   context: context,
                      //   title: "ERROR",
                      //   body: Text("name>2 , email>8 ,pasword>6"),
                      // )..show();
                    }
                  },
                ),
              )
              ////////   TextButton  ////
            ],
          ),
        ),
      ),
    );
  }
}
