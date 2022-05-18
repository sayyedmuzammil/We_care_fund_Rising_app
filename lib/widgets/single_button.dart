// ignore_for_file: unrelated_type_equality_checks, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant_design.dart';

class single_button extends StatelessWidget {
  String title;

  single_button({
    required this.title,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
      child: TextButton(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Styles.primary_black,
            primary:  Styles.primary_green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            side: const BorderSide(color: Styles.primary_green),
          ),
          onPressed: () { 
            // data_control.categoryButtonClicked.value = currentIndex;
            print('Pressed');
          },
        ),
     
    );
  }
}
