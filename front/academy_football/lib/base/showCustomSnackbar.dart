import 'dart:html';

import 'package:flutter/material.dart';


import 'package:get/get.dart';




void showCustomSnackbar(String message, {bool isError=true, String title="Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    messageText: Text(
      message,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: isError ? Colors.redAccent : Colors.green,
  );
}
