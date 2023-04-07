
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:star/core/utils/app_enums.dart';
import 'package:star/translation/translation.dart';
import 'component/alert.dart';

class SignIN extends StatefulWidget {
  @override
  _SignINState createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  /////////////   Password obscure          ////////////////
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
  /////////////   Password obscure          ////////////////
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String email = "";
  String password = "";

  ////
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

  ////////////////////////////////////
  var cc = Get.put(LanguageController());

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
                "SI".tr,
                style: styleFunc(fontsize: 30, color: AppColors.kWhiteColor),
              ),
              SizedBox(
                height: 40.0,
              ),
              ////////////////////////////////
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
                      borderSide: BorderSide(color: AppColors.kWhiteColor, width: 1.0),
                    ),
                    ////////   focusedBorder ////
                  ),
                  /////////     decoration: InputDecoration   ////////
                  controller: _emailController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: AppColors.kWhiteColor,
                  cursorHeight: 27.0,
                  cursorRadius: Radius.circular(15.0),
                  cursorWidth: 4.0,
                  showCursor: true,
                  autocorrect: true,
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                  /////    decoration: InputDecoration  /////
                  decoration: InputDecoration(
                    hintText: "EYP".tr,
                    hintStyle: styleFunc(color: AppColors.kGrayColor, fontsize: 18),
                    labelText: "P".tr,
                    labelStyle: styleFunc(color: AppColors.kWhiteColor, fontsize: 18),
                    prefixIcon: Icon(
                      Icons.lock_open_outlined,
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
                      borderSide: BorderSide(color: AppColors.kWhiteColor, width: 1.0),
                    ),
                    ////////   focusedBorder ////

                    suffixIcon: IconButton(
                      icon: enable
                          ? Icon(Icons.visibility_off_outlined,
                              color: AppColors.kGrayColor)
                          : Icon(Icons.visibility_outlined, color: AppColors.kWhiteColor),
                      onPressed: togleObscure,
                    ),

                    suffix: enable
                        ? Text("Sh".tr, style: TextStyle(color: AppColors.kGrayColor))
                        : Text("Hd".tr, style: TextStyle(color: AppColors.kWhiteColor)),
                  ),
                  /////////     decoration: InputDecoration   ////////
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: AppColors.kWhiteColor,
                  cursorHeight: 27.0,
                  cursorRadius: Radius.circular(8.0),
                  cursorWidth: 3.0,
                  showCursor: true,
                  obscureText: enable,
                  autocorrect: true,
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Text(
                              "DNYHAA".tr,
                              style:
                                  styleFunc(color: AppColors.kGrayColor, fontsize: 20.0),
                            ),
                            GestureDetector(
                              child: Text(
                                "SU".tr,
                                style: styleFunc(
                                    color: AppColors.kWhiteColor, fontsize: 27.0),
                              ),
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, "SignUp");
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ////////////    TextField     ////////////
              SizedBox(height: 20.0),

              /// ////////   TextButton  ////
              Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: AppColors.kWhiteColor,
                    borderRadius: BorderRadius.circular(15.0)),
                child: TextButton(
                  child: Text("LO".tr,
                      style:
                          styleFunc(color: Color(0xff002699), fontsize: 25.0)),
                  onPressed: () async {
                    if (_emailController.text.length > 8 &&
                        _passwordController.text.length > 6) {
                      setState(() {
                        password = _passwordController.text;
                        email = _emailController.text;
                      });
                      //// signIn  ///
                      try {
                        showdialog(context);
                        _userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: this.email, password: this.password);
                      if(_userCredential != null){
                         if(_userCredential!.user!.emailVerified){
                         Navigator.of(context).pushReplacementNamed("HomePage");
                       }
                       else{
                        Navigator.of(context).pushReplacementNamed("Verfication");
                       }
                      }
                        print(_userCredential?.user?.uid);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          Navigator.of(context).pop();
                          // AwesomeDialog(
                          //     context: context,
                          //     title: "user",
                          //     body: Text("user-not-found"))
                          //   ..show();
                        } else if (e.code == 'wrong-password') {
                          Navigator.of(context).pop();
                          // AwesomeDialog(
                          //     context: context,
                          //     title: "user",
                          //     body: Text("wrong-password"))
                          //   ..show();
                        } else {
                          Navigator.of(context).pop();
                          // AwesomeDialog(
                          //     context: context,
                          //     title: "user",
                          //     body: Text("user-not-found and wrong-password"))
                          //   ..show();
                        }
                      } catch (e) {
                        // AwesomeDialog(
                        //     context: context,
                        //     title: "user",
                        //     body: Text("an error ocurr!"))
                        //   ..show();
                      }

                      //// signUP  ///
                    } else {
                      // AwesomeDialog(
                      //   context: context,
                      //   title: "ERROR",
                      //   body: Text("name>2 , email>8 ,pasword>6"),
                      // )..show();
                    }
                  },
                ),
              ),
              ////////   TextBut ton  ////

              SizedBox(height: 13.0),
              Text("OR".tr,
                  style: styleFunc(color: AppColors.kGrayColor, fontsize: 18.0)),
              SizedBox(height: 10),
              Text("SIW".tr,
                  style: styleFunc(color: AppColors.kGrayColor, fontsize: 18.0)),
              SizedBox(height: 25.0),
              //////////////////////
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "google",
                    backgroundColor: Color(color1),
                    onPressed: () {
                      cc.changeLanguage('ar');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.googlePlus,
                      color: Colors.red[900],
                      size: 50.0,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  FloatingActionButton(
                    heroTag: "facebook",
                    backgroundColor: Color(color2),
                    onPressed: () {
                      cc.changeLanguage('en');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Color(0xff002699),
                      size: 50.0,
                    ),
                  )
                ],
              )
              //////////////////
            ],
          ),
        ),
      ),
    );
  }
}
