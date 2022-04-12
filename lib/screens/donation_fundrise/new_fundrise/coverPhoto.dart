// ignore_for_file: file_names, non_constant_identifier_names, unrelated_type_equality_checks

import 'dart:typed_data';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/new_fundraising.dart';

Uint8List? val;
  Stack cover_Photo() {
    return Stack(
            children: [
              Obx(
                () => data_control.imageTemporary == '' || data_control.imageTemporary=='null' || data_control.imageTemporary==null
                    ? FDottedLine(
                        color:const Color(0xFF172927),
                        strokeWidth: 2.0,
                        dottedLength: 8.0,
                        space: 7.0,
                        corner: FDottedLineCorner.all(20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Styles.primary_black_light,), 
                              height: 25.h,
                              width: double.infinity,
                             
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Styles.KHeight20,
                                  Styles.KHeight20,
                                  Text(
                                    "Add Cover Photos",
                                    style: Styles.RegularText.copyWith(
                                        color: Colors.grey[600]),
                                  )
                                ],
                              )),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image(image: MemoryImage(val!))),
                          height: 25.h,
                          width: 100.w,
                        ),
                      ),
              ),
              SizedBox(
                height: 25.h,
                width: double.infinity,
                child: IconButton(
                    onPressed: () async {
                      val = await pickImage1();
                      if (val.toString() != 'null') {
                        data_control.imageTemporary.value = val.toString();
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Styles.primary_green,
                      size: 32,
                    )),
              ),
            ],
          );
  }