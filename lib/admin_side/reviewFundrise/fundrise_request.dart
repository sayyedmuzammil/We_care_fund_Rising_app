// ignore_for_file: camel_case_types, unrelated_type_equality_checks, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, type_init_formals, unused_local_variable, avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/db_functions/firebase.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/widgets/snackbars.dart';
import '../../widgets/textField.dart';

class FundRise_request extends StatelessWidget {
  FundriseModel? data;

  FundRise_request({
    Key? key,
    this.data,
  }) : super(key: key);

  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _requiredAmountController = TextEditingController();
  final _dateController = TextEditingController();
  final _recipientController = TextEditingController();
  final _storyController = TextEditingController();
  final _planController = TextEditingController();
  final _documentController = TextEditingController();

  Uint8List? val;
  String? pdfUrl;
  FilePickerResult? img;
  List<String> mainImages = [];
  var previusValue;
  String pdfName = '';
    List<String> items = [
    'Education',
    'Environment',
    'Social',
    'Sick Child',
    'Medical',
    'Infrastructure',
    'Art',
    'Disaster',
    'Orphanage',
    'Difable',
    'Humanity',
    'Others'
  ];

  init() {
    if (data != null) {
      String link = data!.documentPdf!;
      link = link.split("/")[7];
      link = link.replaceAll("%20", " ");
      link = link.replaceAll("%2C", ",");
      link = link.substring(0, link.indexOf('.pdf'));
      link = link.replaceAll("%40", "@");
      var x = link.split('%2F');
      pdfName = x.last;

      String expiryData =
          DateFormat('MMM dd').format(DateTime.parse(data!.expireDate!));
      _titleController.text = data!.title!;
      _requiredAmountController.text = data!.totalRequireAmount!.toString();
      _dateController.text = expiryData;
      _planController.text = data!.fundPlan!;
      _recipientController.text = data!.organization!;
      _documentController.text = "$pdfName.pdf";
      _storyController.text = data!.story!;
      _categoryController.text = data!.category!;
      mainImages.add(data!.mainImage!);
      mainImages.addAll(data!.childImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    data_control.selectedValueDrop = null;

    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: const Text(
          "New Fund Request",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Styles.primary_green,
                  )));
        }),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 25.h,
              width: 100.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CarouselSlider(
                    options: CarouselOptions(
                      height: 35.h,
                      viewportFraction: 1,
                      autoPlay: true,
                      disableCenter: false,
                    ),
                    items: mainImages /* imageList1 */
                        .map(
                          (item) => SizedBox(
                            width: 100.w,
                            child: Image.network(
                              item,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                        .toList()),
              ),
            ),
            Styles.KHeight10,
            Styles.KHeight20,
            const Text(
              "Fundraising Details ",
              style: Styles.Header,
            ),
            Styles.KHeight10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Styles.KWidth20,
                    const Text(
                      "Title",
                      style: Styles.RegularTextBold,
                    ),
                    Text(
                      "*",
                      style: Styles.RegularTextBold.copyWith(color: Colors.red),
                    ),
                  ],
                ),
                text_field(
                  inputType: TextInputType.none,
                  Text_field_controller: _titleController,
                  hintText: 'Title',
                ),
                Styles.KHeight10,
                Row(
                  children: [
                    Styles.KWidth20,
                    const Text(
                      "Category",
                      style: Styles.RegularTextBold,
                    ),
                    Text(
                      "*",
                      style: Styles.RegularTextBold.copyWith(color: Colors.red),
                    ),
                  ],
                ),
                GetBuilder<GetController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                          isExpanded: true,
                          hint: Text(
                            previusValue ?? data!.category,
                            style:const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                           
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                       
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: controller.selectedValueDrop,
                          onChanged: (value) {
                            controller.selectedValueDrop = value as String;
                            controller.update();
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down,
                          ),
                          iconSize: 24,
                          iconEnabledColor: Colors.grey,
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 50,
                    
                          buttonPadding:
                              const EdgeInsets.only(left: 20, right: 12),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Styles.primary_black_light,
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.only(left: 20, right: 12),
                        
                          dropdownPadding: null,
                          dropdownMaxHeight: 35.h,

                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Styles.primary_black_light,
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(20),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-0, 0),
                        )),
                      );
                    },
                  ),
                  
                Styles.KHeight10,
                Row(
                  children: [
                    Styles.KWidth20,
                    const Text(
                      "Total Donation Required",
                      style: Styles.RegularTextBold,
                    ),
                    Text(
                      "*",
                      style: Styles.RegularTextBold.copyWith(color: Colors.red),
                    ),
                  ],
                ),
                text_field(
                  inputType: TextInputType.none,
                  Text_field_controller: _requiredAmountController,
                  isVisible: true,
                  suffix_icon: const Icon(
                    Icons.currency_rupee,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
                Styles.KHeight10,
                SizedBox(
                  width: 80.w,
                  child: Row(
                    children: [
                      Styles.KWidth20,
                      const FittedBox(
                          child: Text(
                        "Choose Donation Expiration Date",
                        style: Styles.RegularTextBold,
                      )),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                text_field(
                  inputType: TextInputType.none,
                  Text_field_controller: _dateController,
                  isVisible: true,
                  suffix_icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
                Styles.KHeight10,
                SizedBox(
                  width: 83.w,
                  child: Row(
                    children: [
                      Styles.KWidth20,
                      const FittedBox(
                          child: Text(
                        "Fund Usage Plan",
                        style: Styles.RegularTextBold,
                      )),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                text_field(
                  inputType: TextInputType.none,
                  Text_field_controller: _planController,
                  hintText: 'Fund Usage Plan',
                  line_no: 5,
                ),
                Styles.KHeight10,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 1,
                    color: const Color(0xFF37424F),
                  ),
                ),
                Styles.KHeight10,
                const Text(
                  "Donation Recipient Details ",
                  style: Styles.Header,
                ),
                Styles.KHeight20,
                SizedBox(
                  width: 83.w,
                  child: Row(
                    children: [
                      Styles.KWidth20,
                      const SizedBox(
                          child: FittedBox(
                              child: Text(
                        "Name of Recipients (People/Organization)",
                        style: Styles.RegularTextBold,
                      ))),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                text_field(
                  inputType: TextInputType.none,
                  Text_field_controller: _recipientController,
                  // hintText: 'Name',
                ),
                Styles.KHeight10,
                SizedBox(
                  width: 80.w,
                  child: Row(
                    children: [
                      Styles.KWidth20,
                      const FittedBox(
                        child: Text(
                          "Donation Proposal Documents",
                          style: Styles.RegularTextBold,
                        ),
                      ),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Styles.primary_black_light,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: TextFormField(
                    onTap: () {
                      openFile(
                          url: data!.documentPdf,
                          fileName: _documentController.text);
                    },
                    keyboardType: TextInputType.none,
                    style: const TextStyle(color: Colors.white),
                    controller: _documentController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 20,
                        top: 12,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Styles.primary_green, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintStyle: Styles.RegularText.copyWith(
                        color: const Color(0xFF37424F),
                      ),
                    ),
                  ),
                ),
                Styles.KHeight10,
                SizedBox(
                  width: 83.w,
                  child: Row(
                    children: [
                      Styles.KWidth20,
                      const FittedBox(
                          child: Text(
                        "Story",
                        style: Styles.RegularTextBold,
                      )),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                text_field(
                  inputType: TextInputType.none,
                  Text_field_controller: _storyController,
                  hintText: 'Story of donation recipients',
                  line_no: 5,
                ),
                Styles.KHeight20,
                SizedBox(
                  width: 100.w,
                  height: 10.w,
                  child: TextButton(
                    child: const Text(
                      'See Profile',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.primary_green,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0)),
                      side: const BorderSide(color: Styles.primary_green),
                    ),
                    onPressed: () async {
                      print('got to profile');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Styles.primary_black,
          border: Border.all(
            width: .8,
            color: const Color(0xFF37424F),
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        width: double.infinity,
        height: 20.w,
        child: Card(
            elevation: 10,
            color: Styles.primary_black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Styles.KWidth10,
                    cancel_button(
                        'Reject',
                        const Icon(
                          Icons.close,
                        ),
                        Colors.red),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55.w,
                      height: 12.w,
                      child: TextButton(
                        child: const Text(
                          'Publish',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Styles.primary_green,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0)),
                          side: const BorderSide(color: Styles.primary_green),
                        ),
                        onPressed: () async {
                          final status =
                              await changeStatus('publish', data!.fundraiseId!);
                              print("9999 $status");
                              CustomSnackBar('Success', 'the fund rise of ${data!.title} is published' ,Styles.primary_green,  Icons.done);
                        },
                      ),
                    ),
                    Styles.KWidth10,
                  ],
                )
              ], 
            )),
      ),
    );
  }

  Future openFile({url, fileName}) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return;

    print("path: ${file.path}");
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File("${appStorage.path}/$name");
    try {
      final Response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(Response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }
}

SizedBox cancel_button(title, icon, color, {FundriseModel? model}) {
  return SizedBox(
    width: 30.w,
    height: 12.w,
    child: TextButton.icon(
      icon: icon,
      label: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Styles.primary_black,
        primary: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
        side: BorderSide(color: color),
      ),
      onPressed: () {
        changeStatus('rejected', model!.fundraiseId!);
        print("status Changed");
      },
    ),
  );
}
