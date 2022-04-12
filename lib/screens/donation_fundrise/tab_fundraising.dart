// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/donation_fundrise/widgets/fundrise_bottom_card.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';
import 'package:we_care/widgets/category_buttons.dart';

Padding tab_fundraising(count) {
  return Padding(
    padding: const EdgeInsets.only(left: 0, right: 0),
    child: Column(
      children: [
        Styles.KHeight10,
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Styles.KWidth20,
                  category_button(
                    title: 'All(9)',
                    currentIndex: 0,
                  ),
                  category_button(
                    title: 'On Going($count)',
                    currentIndex: 1,
                  ),
                  category_button(
                    title: 'Past($count)',
                    currentIndex: 2,
                  ),
                  category_button(
                    title: 'Pending($count)',
                    currentIndex: 3,
                  ),
                ])),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return donation_card(
                  card_bottom: const card_bottom_fundrise(),
                  bg_image: 'assets/images/blind.jpg',
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
