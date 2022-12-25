import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:star/component/alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:star/eidit_note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /////////////////
  // TextEditingController _searchController = TextEditingController();
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

  ///////////////////
  List idDoc = [];
  deleteData(id) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("note");
    await collectionReference.doc(id).delete();
  }

/////////////////
  List lData = [];

  getDat() {
    FirebaseFirestore.instance
        .collection("note")
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        setState(() {
          lData.add(element.data());
          idDoc.add(element.id);
        });
      });
    });
  }

  @override
  void initState() {
    lData = [];
    idDoc = [];
    getDat();
    getDataColor();
    super.initState();
  }

  /////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          (color1 == Color(0xff4d94ff).value) ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor:
            (color1 == Color(0xff4d94ff).value) ? Colors.blue : Colors.black,
        leading: Icon(
          Icons.home_outlined,
          color: (color1 == Color(0xff4d94ff).value) ? kGrayColor : kWhiteColor,
        ),
        title: Text(
          "HP".tr,
          style: styleFunc(
            color:
                (color1 == Color(0xff4d94ff).value) ? kGrayColor : kWhiteColor,
          ),
        ),
        actions: [
          Center(
              child: Text(
            "LOu".tr,
            style: styleFunc(
              color: (color1 == Color(0xff4d94ff).value)
                  ? kGrayColor
                  : kWhiteColor,
            ),
          )),
          IconButton(
            color: Colors.red,
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("SignIn");
              } catch (e) {
                print(e);
                // AwesomeDialog(
                //     title: "error",
                //     context: context,
                //     body: Text("an error occur"))
                //   ..show();
              }
            },
          )
        ],
      ),
      body: lData.isEmpty
          ? Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.7,
                    //   width: MediaQuery.of(context).size.width * 0.7,
                    //   child: Image.asset("assets/images/note.json"),
                    // ),
                    Center(
                      child: Text(
                        "NIA".tr,
                        style: styleFunc(
                            fontsize: 30.0,
                            color: (color1 == Color(0xff4d94ff).value)
                                ? kGrayColor
                                : kWhiteColor),
                      ),
                    )
                  ],
                ),
              ),
            )
          : ListView(
              shrinkWrap: true,
              children: [
                /* Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextField(
                      /////    decoration: InputDecoration  /////
                      decoration: InputDecoration(
                        hintText: "Enter your title note ",
                        hintStyle: styleFunc(color: kGrayColor),

                        prefixIcon: Icon(
                          Icons.email,
                          color: kWhiteColor,
                        ),

                        /////   enabledBorder enabled start shape////
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              BorderSide(color: kWhiteColor, width: 1.0),
                        ),
                        /////   enabledBorder ////

                        ////////   focusedBorder at writting  ////
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              BorderSide(color: kWhiteColor, width: 1.0),
                        ),
                        ////////   focusedBorder ////
                      ),
                      /////////     decoration: InputDecoration   ////////
                      controller: _searchController,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: kWhiteColor,
                      cursorHeight: 27.0,
                      cursorRadius: Radius.circular(15.0),
                      cursorWidth: 4.0,
                      showCursor: true,
                      autocorrect: true,
                      textInputAction: TextInputAction.done,
                      //  onChanged: searchData,
                    ),
                  ),
                ),
                */
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: lData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      //width: MediaQuery.of(context).size.width * 0.80,
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                            colors: [
                              Color(color1),
                              Color(color2),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      child: ListTile(
                        title: Text(
                          "${lData[index]["title"]}",
                          style: styleFunc(color: kWhiteColor, fontsize: 20.0),
                        ),
                        //////////////
                        leading: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.removeFormat,
                            color: Colors.red[900],
                          ),
                          onPressed: () async {
                            ///////////// *****deleteData******* /////////
                            await deleteData(idDoc[index]);
                            setState(() {
                              lData = [];
                              idDoc = [];
                            });
                            await getDat();
                            ///////////// ******deleteData****** /////////
                          },
                        ),
                        //////////////////////
                        trailing: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.edit,
                            color: kWhiteColor,
                          ),
                          onPressed: () {
                            //////////////////
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditNote(
                                    title: lData[index]["title"],
                                    content: lData[index]["content"],
                                    idDoc: this.idDoc[index],
                                  );
                                },
                              ),
                            );

                            ///////////////////////////
                          },
                        ),
                        subtitle: Text(
                          "${lData[index]["content"]}",
                          style: TextStyle(
                              fontFamily: "GowunBatang", color: kWhiteColor),
                          // overflow: TextOverflow.clip,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            isExtended: true,
            backgroundColor:
                (color1 == Color(0xff4d94ff).value) ? Colors.blue : kGrayColor,
            child: Center(
                child: Icon(
              Icons.settings,
              color: (color1 == Color(0xff4d94ff).value)
                  ? kGrayColor
                  : kWhiteColor,
            )),
            heroTag: "settings",
            onPressed: () {
              Navigator.pushNamed(context, "Settings");
              //  Navigator.pushNamed(context, "AddNote");
            },
          ),
          //////////////
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            isExtended: true,
            backgroundColor:
                (color1 == Color(0xff4d94ff).value) ? Colors.blue : kGrayColor,
            child: Center(
              child: Text(
                "ADD".tr,
                style: styleFunc(
                    fontsize: 20,
                    color: (color1 == Color(0xff4d94ff).value)
                        ? kGrayColor
                        : kWhiteColor),
              ),
            ),
            heroTag: "add",
            onPressed: () {
              Navigator.pushNamed(context, "AddNote");
            },
          ),
        ],
      ),
    );
  }
}
