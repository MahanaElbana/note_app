import 'package:flutter/material.dart';

showdialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Loading ---- ",
          style: styleFunc(color: kGrayColor),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.transparent,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      );
    },
  );
}

TextStyle styleFunc({fontsize, required Color color}) {
  return TextStyle(
    fontFamily: "Courgette",
    color: color,
    fontSize: fontsize,
  );
}

Color kGrayColor = Color(0xff373f49);
Color kWhiteColor = Colors.white;
