// ignore_for_file: unrelated_type_equality_checks, must_be_immutable, camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:we_care/screens/donation_fundrise/seeResultScreen.dart';
import '../constant_design.dart';

class single_button extends StatelessWidget {
  String title;
  bool resultBtn;
  single_button({
    required this.title,
    this.resultBtn = false,
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
          primary: Styles.primary_green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          side: const BorderSide(color: Styles.primary_green),
        ),
        onPressed: () {
          if (resultBtn) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRightWithFade,
                child: const SeeResultScreen(),
              ),
            );
          } else {
            print("not a result button");
          }
        },
      ),
    );
  }
}
