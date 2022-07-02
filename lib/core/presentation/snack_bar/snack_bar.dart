
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void openSnackBar({String title = '', String message = ''}) {
    Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void openLoadingDialog() {
    if (Get.isDialogOpen!) return;
    Get.dialog(Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        child: CircularProgressIndicator()));
  }

}