import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:star/component/alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:star/translation/translation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //String lang = "ar";
  LanguageController languageController = Get.put(LanguageController());
  void changeLanguage() {
    if (languageController.lang == "ar".obs) {
      languageController.changeLanguage("en");
      languageController.lang = "en".obs;
    } else {
      languageController.changeLanguage("ar");
      languageController.lang = "ar".obs;
    }
  }

  /////////////////  *******************  //////////
  SharedPreferences? _prefs;
  ///// backGround /////
  int color1 = Color(0xff4d94ff).value;
  int color2 = Color(0xff0052cc).value;
  ///// backGround /////
  ///
  saveDataColor(int co1, co2) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs!.setInt("c1", co1);
    _prefs!.setInt("c2", co2);
  }

  void getDataColor() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      color1 = _prefs!.getInt("c1") ?? Color(0xff4d94ff).value;
      color2 = _prefs!.getInt("c2") ?? Color(0xff0052cc).value;
    });
  }

  //////////////////////******** url_launcher **********/////////////////
  /// [scheme] == > 1]"http" or "https"  2]"mailto"    3]"tel"    4]"sms"
  /// [path] == > ممكن يكون رقم وموبيل  او يكون ايميل اويكون رابط

  String _facebookUrl =
      "https://www.facebook.com/profile.php?id=156565621138";

  //String emailaddress =  Uri(scheme: 'mailto', path: 'cbmbbmj@gmail.com').toString();
  String emailaddress = "mailto:examplej@gmail.com";

  //// tel:<phone number>, e.g. tel:+1 555 010 999  ////
  String phonenumber = Uri(scheme: "tel", path: "016565651556575").toString();

  ////// sms:<phone number>, e.g. sms:5550101234
  String error = "";
  void lanchUrl(String url) async {
    try {
      await canLaunch(url) ? await launch(url) : throw "watting...";
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  //////////////////////******** Url_Lancher **********////////////////////////////
  /////////////////////////// addRating////////////////////////////////////
  double initialRating = 3;
  addRating(double value) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("rate");
    await collectionReference
        .doc("${FirebaseAuth.instance.currentUser?.uid}")
        .set({
      "rating": value,
      "username": FirebaseAuth.instance.currentUser?.email
    }, SetOptions(merge: true));
  }

  getRating() async {
    FirebaseFirestore.instance
        .collection("rate")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((DocumentSnapshot doc) {
      setState(() {
        initialRating = doc.get("rating");
      });
    });
  }

/////////////////////////// addRating////////////////////////////////////
  //////

  ///
  @override
  void initState() {
    getDataColor();
    getRating();
    super.initState();
  }

  /////////////////  *******************  //////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        // alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(color1),
            Color(color2),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: (color1 == Color(0xff4d94ff).value)
                            ? kGrayColor
                            : kWhiteColor,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "HomePage");
                      },
                    ),
                    Text(
                      "S".tr,
                      style: styleFunc(
                          color: (color1 == Color(0xff4d94ff).value)
                              ? kGrayColor
                              : kWhiteColor,
                          fontsize: 25.0),
                    )
                  ],
                ),
              ),
              ListTile(
                  title: Text(
                    (color1 == Color(0xff4d94ff).value) ? "LT".tr : "DT".tr,
                    style: styleFunc(
                        color: (color1 == Color(0xff4d94ff).value)
                            ? kGrayColor
                            : kWhiteColor,
                        fontsize: 27),
                  ),
                  leading: (color1 == Color(0xff4d94ff).value)
                      ? Icon(
                          Icons.light_mode,
                          color: kGrayColor,
                        )
                      : Icon(
                          Icons.dark_mode,
                          color: kWhiteColor,
                        ),
                  onTap: () {
                    setState(() {
                      color1 = (color1 == Color(0xff4d94ff).value)
                          ? Color(0xff1d2f2f).value
                          : Color(0xff4d94ff).value;
                      color2 = (color2 == Color(0xff0052cc).value)
                          ? Color(0xff0a1010).value
                          : Color(0xff0052cc).value;
                    });
                    saveDataColor(color1, color2);
                  }),
              /////////////////
              //////////////////////         lang ///////////////////
              ListTile(
                  title: Text(
                    "CL".tr,
                    style: styleFunc(
                        color: (color1 == Color(0xff4d94ff).value)
                            ? kGrayColor
                            : kWhiteColor,
                        fontsize: 27),
                  ),
                  leading: (color1 == Color(0xff4d94ff).value)
                      ? Icon(
                          Icons.light_mode,
                          color: kGrayColor,
                        )
                      : Icon(
                          Icons.dark_mode,
                          color: kWhiteColor,
                        ),
                  onTap: () {
                    changeLanguage();
                  }),

              /////////////////////////////////////////////////
              SizedBox(
                height: 14.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Divider(
                  color: (color1 == Color(0xff4d94ff).value)
                      ? kGrayColor
                      : kWhiteColor,
                ),
              ),
              ///////////
              Center(
                child: Text(
                  "AU".tr,
                  style: styleFunc(
                      fontsize: 30,
                      color: (color1 == Color(0xff4d94ff).value)
                          ? kGrayColor
                          : kWhiteColor),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              ListTile(
                onTap: () => lanchUrl(phonenumber),
                title: Text(
                  "01024511575",
                  style: styleFunc(
                      fontsize: 28,
                      color: (color1 == Color(0xff4d94ff).value)
                          ? kGrayColor
                          : kWhiteColor),
                ),
                leading: Icon(
                  Icons.phone,
                  color: (color1 == Color(0xff4d94ff).value)
                      ? Colors.red[900]
                      : Colors.blue,
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: (color1 == Color(0xff4d94ff).value)
                      ? Colors.yellow
                      : Colors.green,
                ),
              ),
              ///////////
              SizedBox(
                height: 12.0,
              ),
              ListTile(
                onTap: () {
                  lanchUrl(_facebookUrl);
                  // _createEmail();
                },
                title: Text(
                  "FB".tr,
                  style: styleFunc(
                      fontsize: 28,
                      color: (color1 == Color(0xff4d94ff).value)
                          ? kGrayColor
                          : kWhiteColor),
                ),
                leading: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: (color1 == Color(0xff4d94ff).value)
                      ? Colors.red[900]
                      : Colors.blue,
                ),
                trailing: Text(
                  "$error",
                  style: styleFunc(
                      fontsize: 28,
                      color: (color1 == Color(0xff4d94ff).value)
                          ? kGrayColor
                          : kWhiteColor),
                ),
              ),
              /////////////////////////////////
              SizedBox(
                height: 12.0,
              ),
              ListTile(
                onTap: () {
                  lanchUrl(emailaddress);
                  // _createEmail();
                },
                title: Text(
                  "E".tr,
                  style: styleFunc(
                      fontsize: 28,
                      color: (color1 == Color(0xff4d94ff).value)
                          ? kGrayColor
                          : kWhiteColor),
                ),
                leading: FaIcon(
                  FontAwesomeIcons.mailBulk,
                  color: (color1 == Color(0xff4d94ff).value)
                      ? Colors.red[900]
                      : Colors.blue,
                ),
                trailing: Text(
                  (error == "") ? "SM".tr : "$error",
                  style: styleFunc(
                      fontsize: 28,
                      color: (color1 == Color(0xff4d94ff).value)
                          ? kGrayColor
                          : kWhiteColor),
                ),
              ),
              /////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 14.0,
              ),
              Text(
                "GAVFU".tr,
                style: styleFunc(
                    fontsize: 28,
                    color: (color1 == Color(0xff4d94ff).value)
                        ? kGrayColor
                        : kWhiteColor),
              ),
              SizedBox(
                height: 14.0,
              ),
              RatingBar.builder(
                initialRating: initialRating,
                minRating: 0.5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (double rating) async {
                  await addRating(rating);
                },
              ),
              /////////////////////////////////////////////////////////////////////
              /* RatingBar.builder(
                //allowHalfRating: true,
                direction: Axis.horizontal,
                itemCount: 5,
                initialRating: 3,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                      );
                    case 1:
                      return Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                      );
                    case 2:
                      return Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                      );
                    case 3:
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                      );
                    case 4:
                      return Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                      );
                    default:
                      return Container();
                  }
                },
                onRatingUpdate: (double value) {
                  print(value);
                },
              )*/
              /////////////////////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
