// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dbController.dart';

tab_Activity(bgImage, dateFormated) {
  final DbController _controller = Get.find();
  return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView.builder(
        itemCount: _controller.myFundDonators.length,
        itemBuilder: (context, index) {
          final data = _controller.myFundDonators;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.parse(data[index]["date"])),  
                style: Styles.RegularText.copyWith(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Styles.KHeight10,
                    Container(
                      height: 20.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Styles.primary_green_light),
                        color: Styles.primary_black_light,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [ 
                          Styles.KWidth10,
                           CircleAvatar(
                            backgroundColor: Styles.primary_black,
                            radius: 25,
                            backgroundImage:
                               (data[index]["anonymous"]==true) ? AssetImage('assets/images/Anonymous_Avatar.png') as ImageProvider : NetworkImage(data[index]["profile"]),
                          ),
                          Styles.KWidth20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                (data[index]["anonymous"]==true) ?'Anonymous': data[index]['name'], 
                                style: Styles.RegularTextBold,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'has donated ',
                                    style: Styles.RegularText.copyWith(
                                        color: Colors.white),
                                  ),
                                  Text(
                                    (data[index]['amount']).toString(),
                                    style: Styles.RegularText.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ));
}
