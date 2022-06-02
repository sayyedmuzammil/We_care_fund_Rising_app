// ignore_for_file: camel_case_types, unrelated_type_equality_checks, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, type_init_formals, unused_local_variable, body_might_complete_normally_nullable, avoid_print

import 'dart:io';
import 'dart:typed_data';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/image_square.dart';
import 'package:we_care/widgets/snackbars.dart';
import '../../../controller/dataController.dart';
import '../../../controller/dbController.dart';
import '../../../db_functions/auth_method.dart';
import '../../../widgets/textField.dart';


class newFundrising extends StatelessWidget {

  FundriseModel? data;

  newFundrising({
    Key? key,
  
    this.data,
  }) : super(key: key);

  final _titleController = TextEditingController();
  final _requiredAmountController = TextEditingController();
  final _dateController = TextEditingController();
  final _recipientController = TextEditingController();
  final _storyController = TextEditingController();
  final _planController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

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

  final DbController _myDonationController =
      Get.put(DbController());
  Uint8List? val;
  String? pdfUrl;
  FilePickerResult? img;
  List<String> childImages = [];
  var previusValue;

  init() {
    if (data != null) {
      String expiryData =
          DateFormat('MMM dd').format(DateTime.parse(data!.expireDate!));
      _titleController.text = data!.title!;
      _requiredAmountController.text = data!.totalRequireAmount!.toString();
      _dateController.text = expiryData;
      _planController.text = data!.fundPlan!;
      _recipientController.text = data!.organization!;
      _storyController.text = data!.story!;
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
          "Create New Fundraising",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                data_control.mainImage = '';
                for (var i = 0; i < 4; i++) {
                  data_control.squaredImage[i] = '';
                }

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
            Stack(
              children: [
                GetBuilder<GetController>(
                  builder: (controller) => controller.mainImage == '' ||
                          controller.mainImage == 'null' ||
                          controller.mainImage == null
                      ? FDottedLine(
                          color: const Color(0xFF172927),
                          strokeWidth: 2.0,
                          dottedLength: 8.0,
                          space: 7.0,
                          corner: FDottedLineCorner.all(20.0),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Styles.primary_black_light,
                                ),
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
                                child: Image(
                                    image: Image.file(File(
                                            data_control.mainImage!.toString()))
                                        .image)),
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
                  
                        img = await FilePicker.platform.pickFiles(
                            allowMultiple: false, type: FileType.image);
                        if (img != null) {
                          final path = img!.files.single.path;
                      
                          data_control.mainImage = path;
                          data_control.update();
                        }
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Styles.primary_green,
                        size: 32,
                      )),
                ),
              ],
            ),
            Styles.KHeight20,
            SizedBox(
              width: 80.w,
              child: FittedBox(
                child: Wrap(
                  spacing: 22.0,
                  children: [
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
                  GetBuilder<GetController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                          isExpanded: true,
                          hint: Text(
                            previusValue ?? 'Select Item',
                            style: previusValue == null
                                ? Styles.RegularText.copyWith(
                                    color: const Color(0xFF37424F),
                                  )
                                : const TextStyle(
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
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  text_field(
                    inputType: TextInputType.number,
                    Text_field_controller: _requiredAmountController,
                    hintText: '0',
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
                          style: Styles.RegularTextBold.copyWith(
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    color: Styles.primary_black_light,
                    child: TextFormField(
                      onTap: () async {
                        final _selectedDateTemp = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 90)),
                        );

                        if (_selectedDateTemp == null) {
                          return;
                        } else {
                          data_control.selectedDate = _selectedDateTemp;
                          _dateController.text = DateFormat('MMM dd')
                              .format(data_control.selectedDate);

                          print(data_control.selectedDate);
                        }
                      },
                      keyboardType: TextInputType.none,
                      
                      style: const TextStyle(color: Colors.white),
                      controller: _dateController,
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
                        hintText: "Select Date",
                        suffixIcon: const Visibility(
                          visible: true,
                          child: Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                            size: 20,
                          ),
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
                  Obx(() => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        color: Styles.primary_black_light,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary:
                                data_control.pdfName.value == "Select Document"
                                    ? const Color(0xFF37424F)
                                    : Colors.white,
                            textStyle: const TextStyle(
                                fontSize: 16,
                                color: Styles.primary_black_light),
                          ),
                          onPressed: () async {
                            print("checking ");
                            final result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf'],
                                allowMultiple: false);
                            if (result == null) return;
                            final x = File(result.files.single.path!);
                            final y = FirebaseStorage.instance
                                .ref("pdfDocument/${result.names.last}");
                            final link = await y.putFile(x);
                            pdfUrl = await link.ref.getDownloadURL();

                            data_control.pdfName.value =
                                result.names.last.toString();

                            final file = result.files.first;
                            // openFile(file);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data_control.pdfName.value,
                              ),
                              const Icon(
                                Icons.cloud_upload_sharp,
                                color: Colors.grey,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                      )),

                  /*  Styles.KHeight10,
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
                  ), */
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
                    draft_or_cancel_button('Draft', const Icon(Icons.save_outlined,),Styles.primary_green),
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
                          onPressed: () async {
                            var res = validator_newFundraise();
                            if (res != 'success') {
                             CustomSnackBar('Error', res, const Color.fromARGB(255, 235, 75, 75).withOpacity(1), Icons.error );
                            } else {
                              final completed = await form_submitted(img!);
                              if (completed == true) {
                                _myDonationController.getDonationDetails();
                                data_control.mainImage = '';
                                for (var i = 0; i < 4; i++) {
                                  data_control.squaredImage[i] = '';
                                }

                                Navigator.pop(context);
                              }
                            }
                          },
                        )),
                    Styles.KWidth10,
                  ],
                )
              ],
            )),
      ),
    );
  }

  String validator_newFundraise() {
 
    var res;
    var _title = _titleController.text.trim();
    var _amount = _requiredAmountController.text.trim();
    var _plan = _planController.text.trim();
    var _recipient_name = _recipientController.text.trim();
    var _story = _storyController.text.trim();
    var _category;
    if (data_control.selectedValueDrop == null) {
      _category = previusValue;
    } else {
      _category = data_control.selectedValueDrop;
    }
    if (img == null) {
      res = "Cover Photo is needed ";
    } else if (_title.isEmpty || _title.length <= 2) {
      res = "Title is required minimum 3 character";
    } else if (_category == null) {
      res = "Please select a categoty";
    } else if (_amount.isEmpty) {
      res = 'please enter the amount';
    } else if (_amount.contains(" ")) {
      res = "Amount - white space is not acceptable";
    } else if (_amount.contains(".")) {
      res = "Amount - decimal number is not acceptable";
    } else if (_amount.contains(",") ||
        _amount.contains("-") ||
        _amount.contains(",") ||
        _amount.startsWith("0")) {
      res = "Enter a Valid Amount";
    } else if (_amount.length <= 4) {
      res = "Required amount is must be greater than 10000";
    } else if (_plan.isEmpty || _plan.length <= 5) {
      res = "Please Explain Your plan of usage of this fund";
    } else if (_recipient_name.isEmpty || _recipient_name.length <= 2) {
      res = "Valid recipient name is required";
    } else if (_story.isEmpty || _story.length <= 10) {
      res = "Breifly explain the story";
    } else if (data_control.TermsCheck == false) {
      res = "Please check terms and conditions";
    } else {
      res = "success";
    }
    print("passing result $res");
    return res;
  }

  Future<bool> form_submitted(FilePickerResult image) async {
    bool completed = false;
    User? currentUser = db_control.auth.currentUser;
    final String fundriseId = const Uuid().v1();

    for (var item in data_control.child_image_list) {
      final img = await imageUpload(item);
      childImages.add(img!);
    }
    String _category;
    String _title = _titleController.text;
    if (data_control.selectedValueDrop == null) {
      _category = previusValue;
    } else {
      _category = data_control.selectedValueDrop!;
    }
    int _requiredAmount = 0;
    if (_requiredAmountController.text != '') {
      _requiredAmount = int.parse(_requiredAmountController.text);
    }
    String _expireDate = data_control.selectedDate.toString();
    String _fundPlan = _planController.text;
    String _recipient = _recipientController.text;
    String _story = _storyController.text;
    String res = 'some error';
    res = "success";
    String? imageUrl = await imageUpload(image);
    var fundrisemodel = FundriseModel(
      fundraiseId: fundriseId,
      userId: currentUser!.uid,
      mainImage: imageUrl!,
      childImage: childImages,
      title: _title,
      category: _category,
      totalRequireAmount: _requiredAmount,
      expireDate: _expireDate,
      fundPlan: _fundPlan,
      organization: _recipient,
      documentPdf: pdfUrl,
      story: _story,
      status: 'review',
      donatorsCount: 0,
      fundriseAmount: 0,
    );
    await db_control.firestrore
        .collection('fundrise')
        .doc(fundriseId)
        .set(fundrisemodel.toMap())
        .then((value) {
      completed = true;
     
      CustomSnackBar('Success', 'Form submitted Successfullys',Styles.primary_green,  Icons.done );
    });
    return completed;
  }

}

pickImage1() async {
  final ImagePicker _imagePicker = ImagePicker();
  // final img = await ImagePicker().pickImage(source: ImageSource.gallery);
  final _file = await _imagePicker.pickImage(source: ImageSource.gallery);
  if (_file != null) {
    return await _file.readAsBytes();
  }
}

Future<String?> imageUpload(FilePickerResult image) async {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final path = image.files.single.path;
  final fileName = image.files.single.name;
  File file = File(path!);
  try {
    final ref = storage.ref(
        'fundriseImages/${FirebaseAuth.instance.currentUser!.uid}/$fileName');
    final link = await ref.putFile(file).whenComplete(() => null);
    String imageUrl = await link.ref.getDownloadURL();
    return imageUrl;
  } on FirebaseException catch (e) {
    print(e);
  }
}

SizedBox draft_or_cancel_button(title, icon, color, { FundriseModel? model} ) {
    return SizedBox(
                    width: 30.w,
                    height: 12.w,
                    child: TextButton.icon(
                      icon: icon ,
                      label:  Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Styles.primary_black,
                        primary: color,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0)),
                        side:  BorderSide(color: color ),
                      ),
                      onPressed: () {
                     
                      },
                    ),
                  );
  }