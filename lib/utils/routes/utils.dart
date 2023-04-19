import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static showFlushBar(String message, BuildContext context) {
    Flushbar(
      title: "StrawBerry",
      routeColor: Colors.amber[300],
      margin: const EdgeInsets.all(15),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(20),
      message: message,
    ).show(context);
  }

  static showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green[400],
      content: Text(message),
      dismissDirection: DismissDirection.horizontal,
    ));
  }

  static changeFocusNode(
      BuildContext context, FocusNode currentNode, FocusNode nodeToFocus) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nodeToFocus);
  }
}
