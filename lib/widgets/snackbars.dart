// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

CustomSnackBar(title, result, color, customIcon) {
  Get.snackbar(
    title,
    result,
    animationDuration: const Duration(milliseconds: 500),
    duration: const Duration(seconds: 1),
    icon: Icon(
      customIcon,
      size: 36,
      color: Colors.black,
    ),
    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color,
    colorText: Colors.white,
  );
}
