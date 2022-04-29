// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/widgets/category_buttons.dart';

class card_bottom_fundrise extends StatelessWidget {
  const card_bottom_fundrise({
    Key? key, 
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
          SizedBox(
            width: 25.w,
            child: FittedBox(
              child: category_button(
                title: 'See Results',
                currentIndex: 7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
