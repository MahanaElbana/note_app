import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/alert.dart';
import 'package:get/get.dart';

class EditNote extends StatefulWidget {
  EditNote({required this.title, required this.content, required this.idDoc});
  final title;
  final content;
  final idDoc;
  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String idDo = "";
  update(id) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("note");
    await collectionReference.doc(id).update({
      "title": _titleController.text,
      "content": _contentController.text,
    });
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  //////////////////
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

  ///////////////
  @override
  void initState() {
    _titleController.text = widget.title;
    _contentController.text = widget.content;
    idDo = widget.idDoc;
    getDataColor();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(color1),
            Color(color2),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        //alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////////////////////////////////
              Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "HomePage");
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: (color1 == Color(0xff4d94ff).value)
                              ? AppColors.kGrayColor
                              : AppColors.kWhiteColor,
                        ),
                        color: AppColors.kWhiteColor,
                      ),
                      Text(
                        "Up".tr,
                        style: styleFunc(
                            color: (color1 == Color(0xff4d94ff).value)
                                ? AppColors.kGrayColor
                                : AppColors.kWhiteColor,
                            fontsize: 25),
                      ),
                    ],
                  ))
              /////////////////////////////////////////////
              ,
              SizedBox(height: 30.0),
              /////////////////////////////////////////////
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextField(
                  /////    decoration: InputDecoration  /////
                  decoration: InputDecoration(
                    hintText: "EYT".tr,
                    hintStyle: styleFunc(color: AppColors.kGrayColor),
                    labelText: "T".tr,
                    labelStyle: styleFunc(color: AppColors.kWhiteColor),
                    prefixIcon: Icon(Icons.person, color: AppColors.kWhiteColor),

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
                  controller: _titleController,
                  keyboardType: TextInputType.name,
                  cursorColor: AppColors.kWhiteColor,
                  cursorHeight: 27.0,
                  cursorRadius: Radius.circular(15.0),
                  cursorWidth: 4.0,
                  showCursor: true,
                  maxLength: 25,
                  maxLines: 1,
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
                    hintText: "EYC".tr,
                    hintStyle: styleFunc(color: AppColors.kGrayColor),
                    labelText: "C".tr,
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
                  controller: _contentController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.white,
                  cursorHeight: 27.0,
                  cursorRadius: Radius.circular(15.0),
                  cursorWidth: 4.0,
                  showCursor: true,
                  maxLength: 100,
                  maxLines: 3,
                  autocorrect: true,
                  textInputAction: TextInputAction.done,
                ),
              ),
              ///////////////////////
              SizedBox(
                height: 18.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 45.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextButton(
                  child: Text(
                    "Up".tr,
                    style: styleFunc(color: Color(0xff00134d), fontsize: 25.0),
                  ),
                  onPressed: () async {
                    await update(idDo);
                    Duration(seconds: 4);
                    Navigator.pushReplacementNamed(context, "HomePage");
                  },
                ),
              ),
              //////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
