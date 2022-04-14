// ignore_for_file: camel_case_types, unrelated_type_equality_checks, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, type_init_formals

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/coverPhoto.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/image_square.dart';

class newFundrising extends StatelessWidget {
  newFundrising({Key? key}) : super(key: key);

  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _requiredAmountController = TextEditingController();
  final _dateController = TextEditingController();
  final _recipientController = TextEditingController();
  final _uploadProposalController = TextEditingController();
  final _uploadMedicalController = TextEditingController();
  final _storyController = TextEditingController();
  final _planController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
/*   void initState() {
    selectedcontent.isNotEmpty
        ? {
            _categoryController.text = selectedcontent['item'].toString(),
       
          }
        : dataControl.selectedDate = DateTime.now();
    // dataControl.update();
  } */
  Uint8List? val;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: const Text(
          "Create New Fundraising",
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
            cover_Photo(),
            Styles.KHeight20,
            SizedBox(
              width: 80.w,
              child: FittedBox(
                child: Wrap(
                  spacing: 22.0,
                  children: const [
                    getx_image_picker(
                      index: 0,
                    ),
                    getx_image_picker(
                      index: 1,
                    ),
                    getx_image_picker(
                      index: 2,
                    ),
                    getx_image_picker(
                      index: 3,
                    ),
                  ],
                ),
              ),
            ),
            Styles.KHeight20,
            const Text(
              "Fundraising Details ",
              style: Styles.Header,
            ),
            Styles.KHeight10,
            Form(
              key: _globalKey,
              child: Column(
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
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  text_field(
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
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  text_field(
                    Text_field_controller: _categoryController,
                    hintText: 'Category',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                      size: 24,
                    ),
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
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  text_field(
                    Text_field_controller: _requiredAmountController,
                    hintText: '0',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.attach_money_outlined,
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
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  text_field(
                    Text_field_controller: _dateController,
                    hintText: 'Select Date',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.event_outlined,
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
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  text_field(
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
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  text_field(
                    Text_field_controller: _recipientController,
                    hintText: 'Name',
                  ),
                  Styles.KHeight10,
                  SizedBox(
                    width: 80.w,
                    child: Row(
                      children: [
                        Styles.KWidth20,
                        const FittedBox(
                          child: Text(
                            "Upload Donation Proposal Documents",
                            style: Styles.RegularTextBold,
                          ),
                        ),
                        Text(
                          "*",
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  text_field(
                    Text_field_controller: _uploadProposalController,
                    hintText: 'Select Document',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.cloud_upload_sharp,
                      color: Colors.grey,
                      size: 22,
                    ),
                  ),
                  Styles.KHeight10,
                  Row(
                    children: [
                      Styles.KWidth20,
                      SizedBox(
                          width: 80.w,
                          child: const FittedBox(
                            child: Text(
                              "Upload Medical Documents (optional for medical)",
                              style: Styles.RegularTextBold,
                            ),
                          )),
                    ],
                  ),
                  text_field(
                    Text_field_controller: _uploadMedicalController,
                    hintText: 'Select Document',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.cloud_upload_sharp,
                      color: Colors.grey,
                      size: 22,
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
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  text_field(
                    Text_field_controller: _storyController,
                    hintText: 'Story of donation recipients',
                    line_no: 5,
                  ),
                  Styles.KHeight10,
                  Row(
                    children: [
                      GetBuilder<GetController>(
                        builder: (controller) => Checkbox(
                          checkColor: Colors.white,
                          side: const BorderSide(
                            color: Styles.primary_green,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          fillColor:
                              MaterialStateProperty.all(Styles.primary_green),
                          value: data_control.TermsCheck,
                          onChanged: (bool? val) {
                            data_control.TermsCheck = val!;
                            data_control.update();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 70.w,
                        child: const FittedBox(
                            child: Text(
                          "By checking this, you agree to the terms & conditions that\napply to us.",
                          maxLines: 2,
                          style: Styles.RegularTextBold,
                        )),
                      ),
                    ],
                  ),
                  Styles.KHeight10, 
                ],
              ),
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
                    SizedBox(
                      width: 30.w,
                      height: 12.w,
                      child: TextButton.icon(
                        icon: const Icon(Icons.save_outlined), 
                        label: const Text(
                          'Draft',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Styles.primary_black,
                          primary: Styles.primary_green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0)),
                          side: const BorderSide(color: Styles.primary_green),
                        ),
                        onPressed: () {
                          print('Pressed');
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55.w,
                      height: 12.w,
                      child: TextButton(
                        child: const Text(
                          'Create & Submit',
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
                        onPressed: () {
                          print('Pressed');
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
}

class text_field extends StatelessWidget {
  text_field({
    required TextEditingController this.Text_field_controller,
    this.isVisible = false,
    this.suffix_icon = const Icon(Icons.ac_unit),
    this.hintText = '',
    this.line_no = 1,
    this.isPassword=false, 
  });

  final TextEditingController Text_field_controller;
  bool isVisible;
  Icon suffix_icon;
  var hintText;
  int line_no;
  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      color: Styles.primary_black_light,
      child: TextFormField(
       obscureText: isPassword,
        maxLines: line_no,
        style: const TextStyle(color: Colors.white),
        controller: Text_field_controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 12,
          ),
          hintText: hintText,
          suffixIcon: Visibility(
            visible: isVisible,
            child: suffix_icon,
          ),
          hintStyle: Styles.RegularText.copyWith(
            color: const Color(0xFF37424F),
          ),
        ),
        validator: (value) {
          (value) {
            if (value == null || value.isEmpty) {
              return 'Item is required';
            } else if (value.startsWith(" ")) {
              return "Item should not contain whitespace";
            }
          };
        },
      ),
    );
  }
}

pickImage1() async {
  final ImagePicker _imagePicker = ImagePicker();
  final _file = await _imagePicker.pickImage(source: ImageSource.gallery);
  if (_file != null) {
    return await _file.readAsBytes();
  }
}
