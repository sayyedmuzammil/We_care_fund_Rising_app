// ignore_for_file: non_constant_identifier_names, file_names, avoid_print

import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/db_functions/user_model.dart';

import '../db_functions/firebase.dart';

var data_control = Get.put(GetController());

class GetController extends GetxController {
  var categoryButtonClicked = 0.obs;
  String? mainImage;
  Uint8List? profileImage;
  List<FilePickerResult> child_image_list = [];
  List<String> squaredImage = ['', '', '', ''].obs;
  var TermsCheck = false;
  var anonymousCheck = false;
  var RememberCheck = false.obs;
  var signUp = true.obs;
  userModel? user;
  var pdfName = "Select Document".obs;
  var approvalButton = false.obs;
  bool editProfile = false;
  late DateTime selectedDate = DateTime.now();

  String? selectedValueDrop;

//add profile data
  Future<void> refreshUser() async {
    userModel _user = await getUserDetails();
    user = _user;
    // print("refresh $user");
    update();
  }

// ------------------------------------------------ interests
// void interests(){

// var education=false.obs;
// var environment=false.obs;
// var social=false.obs;
// var sick=false.obs;
// var medical=false.obs;
// var infrastructure=false.obs;
// var art=false.obs;
// var disaster=false.obs;
// var orphanage=false.obs;
// var difable=false.obs;
// var humanity=false.obs;
// var others=false.obs;

// }
  final fundRiseStream = <FundriseModel>[].obs;
// FundriseModel? clickedData;
  DateTime? expiry;
   List<FundriseModel> publishedFundriseAll = <FundriseModel>[].obs;
   List<FundriseModel> carousilFundrise = <FundriseModel>[].obs;
  List<FundriseModel> endingFundrise = <FundriseModel>[].obs;
  List<FundriseModel> urgentFundrise = <FundriseModel>[].obs;

  saparatelist() {
    endingFundrise.clear(); 
    urgentFundrise.clear();
    carousilFundrise.clear(); 
    publishedFundriseAll.clear();
    print("i aaaam here ${fundRiseStream.length}");

    for (var item in fundRiseStream) {
      final dayLeft = calculateExpiryDate(item.expireDate!);
      print("678687687 ${item.status}");
      if (dayLeft <= 3 && dayLeft >= 0 && item.status=='publish') {
        endingFundrise.add(item);
        publishedFundriseAll.add(item);
        if(carousilFundrise.length<=5)
        {
        carousilFundrise.add(item);
        }
      } else if(dayLeft > 3 && item.status=='publish'){
        urgentFundrise.add(item);
        publishedFundriseAll.add(item);
            if(carousilFundrise.length<=5)
        {
        carousilFundrise.add(item);
        }
      }
    }

    // update();
    // print(endingFundrise.length);
    // print(urgentFundrise.length);
  }

  @override
  void onInit() {
    fundRiseStream.bindStream(getFundrise());
    //  saparatelist();
    // saparatelist();


    super.onInit();
  }

// ---------------------------------------------------------
}
