import 'package:flutter/material.dart';

enum AlertDialogType { error, warning, correct }

defaultAlertDialog({
  required BuildContext context,
  IconData? iconStatus,
  String? title,
  required AlertDialogType alertDialogType,
  void Function()? yesFunc,
  void Function()? noFunc,
  String? textOfStatus,
  bool? barrierDismissibleStatus,
}) {
  String textStatus = "";
  IconData iconData = Icons.stacked_bar_chart;

  // ========================================= ///
  if (textOfStatus == null && alertDialogType == AlertDialogType.correct) {
    textStatus = "Correct";
  } else if (textOfStatus == null && alertDialogType == AlertDialogType.error) {
    textStatus = "Error !";
  } else if (textOfStatus == null &&
      alertDialogType == AlertDialogType.warning) {
    textStatus = "Warrning !";
  } else {
    textStatus = textOfStatus!;
  }
  // ========================================= ///
  if (iconStatus == null && alertDialogType == AlertDialogType.correct) {
    iconData = Icons.done;
  } else if (iconStatus == null && alertDialogType == AlertDialogType.error) {
    iconData = Icons.error_outline;
  } else if (iconStatus == null && alertDialogType == AlertDialogType.warning) {
    iconData = Icons.warning_amber_outlined;
  } else {
    iconData = iconStatus!;
  }
  // ========================================= ///
  AlertDialog alertDialog = AlertDialog(
    contentPadding: const EdgeInsets.all(0.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    content: SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              //===============================//
              color: alertDialogType == AlertDialogType.correct
                  ? Colors.greenAccent.shade700
                  : (alertDialogType == AlertDialogType.error
                      ? Colors.red.shade900
                      : Colors.teal.shade700),
              //===============================//
            ),
            height: 140,
            width: double.infinity,
            child: Icon(
              iconData,
              color: Colors.white,
              size: 50,
            ),
          ),
          const SizedBox(height: 18.0),
          Text(
            textStatus,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.only(right: 16, left: 16),
            ////////////////////////////////////////////////
            child: Text(
              title == null && alertDialogType == AlertDialogType.correct
                  ? "the operation is done"
                  : (title == null && alertDialogType == AlertDialogType.error
                      ? "try a gain !"
                      : (title == null &&
                              alertDialogType == AlertDialogType.warning
                          ? "take your advice !"
                          : title!)),
            ),
            ////////////////////////////////////////////////
          ),
          const SizedBox(height: 24.0),
          ////////////////////////////////////
          if (yesFunc == null && noFunc != null)
            TextButton(
              onPressed: noFunc,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 24, right: 24),
                decoration: BoxDecoration(
                    color: Colors.red.shade900,
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Text(
                  "No",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          //////////////////////
          if (yesFunc != null && noFunc == null)
            TextButton(
              onPressed: yesFunc,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 24, right: 24),
                decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Text(
                  "Ok",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

          //////////////////////
          if (yesFunc != null && noFunc != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: yesFunc,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 24, right: 24),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Text(
                      "Ok",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: noFunc,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 24, right: 24),
                    decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Text(
                      "No",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ////
          const SizedBox(
            height: 17.0,
          ),
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (context) {
      return alertDialog;
    },
    barrierDismissible: barrierDismissibleStatus ?? true,
  );
}
