import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

//// ==> for File
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class Gui extends StatefulWidget {
  @override
  _GuiState createState() => _GuiState();
}

class _GuiState extends State<Gui> {
  /////////////////////
  final ImagePicker _picker = ImagePicker();
  File? image;

  Future getImage(ImageSource src) async {
    final pickedFile = await _picker.pickImage(source: src);

    if (pickedFile != null) {
      ////////////////////
      setState(() {
        image = File(pickedFile.path);
      });
      var baseName = basename(pickedFile.path);
      Reference imageStorage = FirebaseStorage.instance.ref("image/$baseName");
      await imageStorage.putFile(image!);
      ///////////////
    } else {
      print("no image");
    }
  }

  /////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Container(
        child: Center(
          child: image == null
              ? Text("no selected item ")
              : Container(
                  child: Column(
                  children: [
                    // Image.file(image!),
                    Text('dkl'),
                  ],
                )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var dialog = AlertDialog(
            title: Text("choose your image from :-"),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  /////////
                  Container(
                    child: ListTile(
                      title: Text("Camera"),
                      leading: Icon(Icons.camera_alt_outlined),
                      onTap: () {
                        getImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                  ////////
                  SizedBox(
                    height: 10.0,
                  ),
                  ///////////////            ///////////////
                  Container(
                    child: ListTile(
                      title: Text("gallery"),
                      leading: Icon(Icons.image),
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                  ///////////////            ///////////////

                  ///////////////            ///////////////
                ],
              ),
            ),
          );
          showDialog(
            context: context,
            builder: (context) {
              return dialog;
            },
          );
        },
        child: Icon(Icons.camera_alt_outlined),
        heroTag: "image_picker",
      ),
    );
  }
}
