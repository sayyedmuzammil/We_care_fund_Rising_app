// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:we_care/db_functions/user_model.dart';

import 'firebase.dart';

var data_control=Get.put(GetController());
class GetController extends GetxController {
   var categoryButtonClicked = 0.obs;
  String? mainImage;
  Uint8List? profileImage;
    List<String> child_image_list=['','','',''];
var TermsCheck=false; 
var RememberCheck=false.obs; 
var signUp=true.obs;
userModel? user;
var pdfName="Select Document".obs;

//add profile data
  Future<void> refreshUser() async {
    userModel _user = await getUserDetails();
    user = _user;
    // print("refresh $user");
    update(); 
  }

// ------------------------------------------------ interests
void interests(){

var education=false.obs;
var environment=false.obs;
var social=false.obs;
var sick=false.obs;
var medical=false.obs;
var infrastructure=false.obs;
var art=false.obs;
var disaster=false.obs;
var orphanage=false.obs;
var difable=false.obs;
var humanity=false.obs;
var others=false.obs;
}

// @override
//   void onInit() {

//     // TODO: implement onInit
//     super.onInit();
//   }
}