// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/screens/donation_fundrise/widgets/fundrise_bottom_card.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';
import 'package:we_care/widgets/category_buttons.dart';

import '../../db_functions/firebase.dart';

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
            child: StreamBuilder<List<fundriseModel>>(
              stream:    getFundrise(),
              builder: (context, snapshot) {
                
               
               if(snapshot.data != null){
                return  ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data=snapshot.data![index];
                  // print("${snapshot.data![index].status}");

                      return donation_card(
                        data: data,
                      card_bottom:  card_bottom_fundrise(data: data,),
                      bg_image: data.mainImage!,
                    );
                  },
                );
               }
               else{
                 return Center( child: Text("No data"));
               }
              }
            ),
          ),
        ),
      ],
    ),
  );
}
