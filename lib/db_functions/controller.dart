// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';
import 'package:get/get.dart';

var data_control=Get.put(GetController());
class GetController extends GetxController {
   var categoryButtonClicked = 0.obs;
  var imageTemporary=''.obs;
    List<Uint8List?> image_list_unit=[null,null,null,null];
var TermsCheck=false; 
var RememberCheck=false.obs; 
var signUp=true.obs;
}