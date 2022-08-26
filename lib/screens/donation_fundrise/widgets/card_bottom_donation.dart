// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constant_design.dart';

class CardBottom extends StatelessWidget {
  int? amount;
  // FundriseModel data;
  String buttonText;
  final clickResult;
  CardBottom({
    // required this.data,
    required this.buttonText,
    required this.clickResult,
    this.amount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          amount != null
              ? Row(
                  children: [
                    Text("You have donated",
                        style: Styles.RegularText.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white)),
                    Text(" ₹$amount",
                        style: Styles.RegularText.copyWith(
                            fontSize: 12, color: Styles.primary_green)),
                  ],
                )
              : Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.edit,
                            color: Styles.primary_green,
                            size: 17,
                          ),
                          Text(" Edit",
                              style: Styles.RegularText.copyWith(
                                  fontSize: 12, color: Colors.white)),
                          Styles.KWidth10,
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.share,
                            color: Styles.primary_green,
                            size: 17,
                          ),
                          Text(" Share",
                              style: Styles.RegularText.copyWith(
                                  fontSize: 12, color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                  child: Text(
                    buttonText,
                    style: const TextStyle(fontSize: 16),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Styles.primary_black,
                    primary: Styles.primary_green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    side: const BorderSide(color: Styles.primary_green),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 500), 
                          type: PageTransitionType.rightToLeftWithFade,    
                          child: clickResult),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
