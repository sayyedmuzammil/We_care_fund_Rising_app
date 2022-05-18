// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/widgets/category_buttons.dart';
import 'package:we_care/widgets/single_button.dart';

class card_bottom extends StatelessWidget {
  const card_bottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("You have donated",
                  style: Styles.RegularText.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white)),
              Text(" ₹220",
                  style: Styles.RegularText.copyWith(
                      fontSize: 12, color: Styles.primary_green)),
            ],
          ),
          single_button(
            title: 'Donate Again',
            // currentIndex: 7,
          ),
        ],
      ),
    );
  }
}
