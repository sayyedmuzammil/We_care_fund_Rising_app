// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/db_functions/user_model.dart';

import 'firebase.dart';

var data_control=Get.put(GetController());
class GetController extends GetxController {
   var categoryButtonClicked = 0.obs;
  String? mainImage;
  Uint8List? profileImage;
    List<FilePickerResult> child_image_list=[];
    List<String> squaredImage=['','','',''].obs;
var TermsCheck=false; 
var RememberCheck=false.obs; 
var signUp=true.obs;
userModel? user;
var pdfName="Select Document".obs;
var approvalButton=false.obs;

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
final fundRiseStream=<fundriseModel>[].obs;
@override
  void onInit() {
    print("working on stream buil fundrise");
    fundRiseStream.bindStream( getFundrise());
   
    // TODO: implement onInit
    super.onInit();
  }
}