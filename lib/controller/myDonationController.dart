import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:we_care/db_functions/controller.dart';
import 'package:we_care/db_functions/donators_model.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/db_functions/user_model.dart';

class MyDonationController extends GetxController {

  List<DonatorsModel> donationData = [];
   List<fundriseModel> myDonations=[];

   List<fundriseModel> myFundrise=[];
    List<fundriseModel> reviewFundrise=[];
     List<fundriseModel> completedFundrise=[]; 
     List<fundriseModel> rejectedFundrise=[];
     List<fundriseModel> publishedFundrise=[];
    // List<fundriseModel> totalFundrise=[];

getDonationDetails() async{ 
  print('123called');
  
  myDonations.clear();

  donationData.clear(); 
  
final donationCollection= FirebaseFirestore.instance;
final donation=await donationCollection.collection('donationDb').doc(FirebaseAuth.instance.currentUser!.uid).collection('donation').get();
List<DonatorsModel> data=donation.docs.map((e) => DonatorsModel.fromMap(e.data())).toList();
donationData.addAll(data);

for (var item in data) {
  await getFundriseDetailsDonator(item.fundRiseId!);
}
statusFundrise();
getAllUser();
update();

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



// ---------------------------------------status fundrise
statusFundrise()async{
    reviewFundrise.clear();
  publishedFundrise.clear(); 
  completedFundrise.clear(); 
  rejectedFundrise.clear();
    myFundrise.clear();
  List<fundriseModel> data=await getFundRiseFuture();
  for (var item in data) {
  if(item.userId==data_control.user!.userId){

    myFundrise.add(item);
  } 
  }
 print('length${myFundrise.length}');
  for (var item in myFundrise) {

    if (item.status=='review') {
      reviewFundrise.add(item); 
      
    } else  if (item.status=='publish') {
      publishedFundrise.add(item); 
    } else  if (item.status=='completed') {
      completedFundrise.add(item); 
    }
      else  if (item.status=='rejected') {
      rejectedFundrise.add(item); 
    } 
  
  
}

    update();
   

}


// --------------------------------------tab_activity

Future<List<userModel>> getAllUser() async {
  final userDb = await FirebaseFirestore.instance.collection('users').get();
 final allUser =  userDb.docs.map((e) => userModel.fromMap(e.data())).toList();
 for (var item in allUser) {
   getFundriseData(item.userId!);
 }
return allUser;
}

getFundriseData(String id) async {
  var data = [];
 final userDb = await FirebaseFirestore.instance.collection('donationDb').doc(id).collection('donation').get();
 for (var item in userDb.docs) {
     print('11122  ${item.data()['fundRiseId']}');
      print('11122  ${myFundrise.length}');
   for (var item1 in myFundrise) {
      print('11122  ${item1.fundraiseId}');
     if ((item.data()['fundRiseId'])==(item1.fundraiseId)) {
       data.add(id);
     }
   }
 }
   print('11122 leng ${data.length} and $data'); 
}

// ---------------------------------
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDonationDetails();
    getAllUser();
    // statusFundrise();
  }

}
