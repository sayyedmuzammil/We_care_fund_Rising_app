import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:we_care/db_functions/controller.dart';
import 'package:we_care/db_functions/donators_model.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';

class MyDonationController extends GetxController {

  List<DonatorsModel> donationData = [];
   List<fundriseModel> myDonations=[];
    List<fundriseModel> totalFundrise=[];

getDonationDetails() async{ 
  
  myDonations.clear();
  donationData.clear(); 
final donationCollection= FirebaseFirestore.instance;
final donation=await donationCollection.collection('donationDb').doc(FirebaseAuth.instance.currentUser!.uid).collection('donation').get();
List<DonatorsModel> data=donation.docs.map((e) => DonatorsModel.fromMap(e.data())).toList();
donationData.addAll(data);

for (var item in data) {
  await getFundriseDetailsDonator(item.fundRiseId!);
}
update(['donations']);

}

// --------------------------------------------------------------donation future
Future<List<fundriseModel>> getFundriseDetailsDonator (String fundriseIdfromDonate)async{
  
List<fundriseModel> data=await getFundRiseFuture();
for (var item in data) {
  if(item.fundraiseId==fundriseIdfromDonate){
    myDonations.add(item);
  }
  
}
return myDonations;
}

Future <List<fundriseModel>> getFundRiseFuture()async{
  final fundDb=await FirebaseFirestore.instance.collection('fundrise').get();
  final data= fundDb.docs.map((e) => fundriseModel.fromMap(e.data())).toList();
  return data;
}
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDonationDetails();
  }

}