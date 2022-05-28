// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
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
var anonymousCheck=false;
var RememberCheck=false.obs; 
var signUp=true.obs;
userModel? user;
var pdfName="Select Document".obs;
var approvalButton=false.obs;
bool editProfile=false;
  late DateTime selectedDate = DateTime.now();

String? selectedValueDrop=null;

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
// fundriseModel? clickedData;
DateTime? expiry;
List<fundriseModel> endingFundrise = <fundriseModel>[];
  List<fundriseModel> urgentFundrise = <fundriseModel>[];

saparatelist() {
  
                for (var item in fundRiseStream) {
                  final dayLeft = calculateExpiryDate(item.expireDate!);
                  if (dayLeft <= 3 && dayLeft >= 0) {
                    endingFundrise.add(item);
                  }else {
                    urgentFundrise.add(item);
                  }
                }
                print(endingFundrise.length);
                print(urgentFundrise.length);
}



@override
  void onInit() {
   
    fundRiseStream.bindStream( getFundrise());
    // saparatelist();
   
    // TODO: implement onInit
    super.onInit();
  }





// ---------------------------------------------------------
}