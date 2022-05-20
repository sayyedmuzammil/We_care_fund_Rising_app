// ignore_for_file: camel_case_types, unrelated_type_equality_checks, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, type_init_formals, unused_local_variable

import 'dart:io';
import 'dart:typed_data';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/controller.dart';
import 'package:we_care/db_functions/firebase.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/coverPhoto.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/image_square.dart';

import '../../../db_functions/auth_method.dart';
import '../../../db_functions/resources/storage_methods.dart';
import '../../../db_functions/user_model.dart';

class newFundrising extends StatelessWidget {
  Widget firstButton;

  newFundrising({
    Key? key,
    required this.firstButton,
  }) : super(key: key);

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
  String? pdfUrl;
  FilePickerResult? img;
List<String> childImages=[];
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
                        /*  final val = await pickImage1();
              if (val.toString() != 'null') {
                data_control.mainImage = val; 
                data_control.update();
              } */
                        img = await FilePicker.platform.pickFiles(
                            allowMultiple: false, type: FileType.image);
                        final path = img!.files.single.path;
                        print("this $path");
                        data_control.mainImage = path;
                        data_control.update();
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
                                    ? Color(0xFF37424F)
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
                            final x = await File(result.files.single.path!);
                            final y = await FirebaseStorage.instance
                                .ref("pdfDocument/${result.names.last}");
                            final link = await y.putFile(x);
                            print("${link.ref.getDownloadURL()}");
                            pdfUrl = await link.ref.getDownloadURL();

                            print("hello hai ${pdfUrl}");
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
                    firstButton,
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55.w,
                      height: 12.w,
                      child: data_control.approvalButton == false
                          ? TextButton(
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
                                side: const BorderSide(
                                    color: Styles.primary_green),
                              ),
                              onPressed: () async {
                                if (img != null) {
                                  final res = await form_submitted(img!);
                                }

                                Navigator.pop(context);
                              },
                            )
                          : TextButton(
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
                                side: const BorderSide(
                                    color: Styles.primary_green),
                              ),
                              onPressed: () async {
                                if (img != null) {
                                  // final res = await form_submitted(img!);
                                }

                                Navigator.pop(context);
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

  form_submitted(FilePickerResult image) async {
    User? currentUser = db_control.auth.currentUser;
    final String fundriseId = Uuid().v1();

    String _mainImage = '';
    print("before upload to firebase image ${data_control.mainImage}");
    for (var item in data_control.child_image_list) {
     final img=await imageUpload(item);
     childImages.add(img!);
      
    }
// String _mainImage=data_control.mainImage.value;
//     print("checking unit list ${data_control.child_image_list}");
// print("mainImage $_mainImage");
//     if (data_control.child_image_list[0] == null) {
//       print("child image is null");
//     } else {
//       print("not null");
//     }
    // int counter = 0;
    // for (var i = 0; i < 4; i++) {
    //   if (data_control.child_image_list[i] != null) {
    //     // subImages[counter]
    //     final String childImageId = Uuid().v1();
    //     subImages[i] = await StorageMethods().uploadImageToStorage(
    //         childName: 'subImage',uuid: childImageId,
    //         file: ,
    //         isPost: false);

    //     // counter++;
    //   }

    // }
// for(int i=0;i<data_control.child_image_list.length;i++){
//   subImages[i]=data_control.child_image_list[0].toString();
// }
// String
    String _title = _titleController.text;
    String _category = _categoryController.text;
    int _requiredAmount = 0;
    if (_requiredAmountController.text != '') {
      _requiredAmount = int.parse(_requiredAmountController.text);
    }
    String _expireDate = _dateController.text;
    String _fundPlan = _planController.text;
    String _recipient = _recipientController.text;
    // String _proposalPDF = _uploadProposalController.text;
    // String _medicalPDF = _uploadMedicalController.text;
    String _story = _storyController.text;
    String res = 'some error';

    res = "success";
    print("successfully completed $image");
    String? imageUrl = await imageUpload(image);

    var fundrisemodel = fundriseModel(
      fundraiseId: fundriseId,
      userId: currentUser!.uid,
      mainImage: imageUrl,
      childImage: childImages,
      title: _title,
      category: _category,
      totalRequireAmount: _requiredAmount,
      expireDate: _expireDate,
      fundPlan: _fundPlan,
      organization: _recipient,
      documentPdf: pdfUrl,
      // medicalPdf: _medicalPDF,
      story: _story,
      status: 'review',
      donatorsCount: 0,
      fundriseAmount: 0,
    );
    print("before starting db of fundraise");
    await db_control.firestrore
        .collection('fundrise')
        .doc(fundriseId)
        .set(fundrisemodel.toMap());
  }

  // void openFile(PlatformFile file) {
  //   OpenFile.open(file.path!);
  // }
}

pickImage1() async {
  final ImagePicker _imagePicker = ImagePicker();
  // final img = await ImagePicker().pickImage(source: ImageSource.gallery);
  final _file = await _imagePicker.pickImage(source: ImageSource.gallery);
  if (_file != null) {
    return await _file.readAsBytes();
  }
}

class text_field extends StatelessWidget {
  text_field({
    required TextEditingController this.Text_field_controller,
    this.isVisible = false,
    this.suffix_icon = const Icon(Icons.ac_unit),
    this.hintText = '',
    this.line_no = 1,
    this.isPassword = false,
    this.inputType=  TextInputType.streetAddress, 
    this.inputColor= Colors.white, 
  });

  final TextEditingController Text_field_controller;
  bool isVisible;
  Icon suffix_icon;
  var hintText;
  int line_no;
  bool isPassword;
  var inputType;
  Color inputColor;

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
        keyboardType:inputType,        
        obscureText: isPassword,
        maxLines: line_no,
        style:  TextStyle(color:inputColor ),
        controller: Text_field_controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 12,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Styles.primary_green, width: 2.0),
            borderRadius: BorderRadius.circular(20.0),
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
