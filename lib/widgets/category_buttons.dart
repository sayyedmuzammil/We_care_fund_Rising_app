// ignore_for_file: unrelated_type_equality_checks, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_care/db_functions/controller.dart';
import '../constant_design.dart';

class category_button extends StatelessWidget {
  String title;
  int currentIndex;
  category_button({
    required this.title,
    this.currentIndex = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: Obx(
        () => TextButton(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          style: TextButton.styleFrom(
            backgroundColor: data_control.categoryButtonClicked == currentIndex
                ? Styles.primary_green
                : Styles.primary_black,
            primary: data_control.categoryButtonClicked == currentIndex
                ? Colors.white
                : Styles.primary_green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            side: const BorderSide(color: Styles.primary_green),
          ),
          onPressed: () {
            data_control.categoryButtonClicked.value = currentIndex;
            print('Pressed');
          },
        ),
      ),
    );
  }
}
