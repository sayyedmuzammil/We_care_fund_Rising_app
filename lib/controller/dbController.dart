// ignore_for_file: file_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/db_functions/donators_model.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/db_functions/user_model.dart';

class DbController extends GetxController {
  List<DonatorsModel> donationData = [];
  List<FundriseModel> myDonations = [];
  List<FundriseModel> myFundrise = [];
  List<FundriseModel> reviewFundrise = [];
  List<FundriseModel> completedFundrise = [];
  List<FundriseModel> rejectedFundrise = [];
  List<FundriseModel> publishedFundrise = [];
  List<FundriseModel> totalFundrise=[];
  var myFundDonators = [];

  getDonationDetails() async {
    print('123called');

    myDonations.clear();

    donationData.clear();

    final donationCollection = FirebaseFirestore.instance;
    final donation = await donationCollection
        .collection('donationDb')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('donation')
        .get();
    List<DonatorsModel> data =
        donation.docs.map((e) => DonatorsModel.fromMap(e.data())).toList();
    donationData.addAll(data);

    for (var item in data) {
      await getFundriseDetailsDonator(item.fundRiseId!);
    }
    statusFundrise();
    getAllUser();
    update();
  }

// --------------------------------------------------------------donation future
  Future<List<FundriseModel>> getFundriseDetailsDonator(
      String fundriseIdfromDonate) async {
    List<FundriseModel> data = await getFundRiseFuture();
    for (var item in data) {
      if (item.fundraiseId == fundriseIdfromDonate) {
        myDonations.add(item);
      }
    }
    return myDonations;
  }

  Future<List<FundriseModel>> getFundRiseFuture() async {
    totalFundrise.clear();
    final fundDb =
        await FirebaseFirestore.instance.collection('fundrise').get();
    final data =
        fundDb.docs.map((e) => FundriseModel.fromMap(e.data())).toList();
        totalFundrise.addAll(data);
     
        print("123 ${totalFundrise.length}");
    return data;
  }

// ---------------------------------------status fundrise
  statusFundrise() async {
    reviewFundrise.clear();
    publishedFundrise.clear();
    completedFundrise.clear();
    rejectedFundrise.clear();
    myFundrise.clear();
    List<FundriseModel> data = await getFundRiseFuture();
    for (var item in data) {
      if (item.userId == data_control.user!.userId) {
        myFundrise.add(item);
      }
    }
    print('length${myFundrise.length}');
    for (var item in myFundrise) {
      if (item.status == 'review') {
        reviewFundrise.add(item);
      } else if (item.status == 'publish') {
        publishedFundrise.add(item);
      } else if (item.status == 'completed') {
        completedFundrise.add(item);
      } else if (item.status == 'rejected') {
        rejectedFundrise.add(item);
      }
    }

    update();
  }

// --------------------------------------tab_activity

  Future<List<userModel>> getAllUser() async {
    myFundDonators.clear();
    final userDb = await FirebaseFirestore.instance.collection('users').get();
    final allUser =
        userDb.docs.map((e) => userModel.fromMap(e.data())).toList();
    for (var item in allUser) {
      getFundriseData(item.userId!,item.photoUrl!,item.name!);
    }
    return allUser;
  }

  getFundriseData(String id,  String profile,String name) async {
    
    List<Map<String, String>> data = [];
    final userDb = await FirebaseFirestore.instance
        .collection('donationDb')
        .doc(id)
        .collection('donation')
        .get();
    for (var item in userDb.docs) {
      // print('11122  ${item.data()['fundRiseId']}');
      // print('11122  ${myFundrise.length}');
      for (var item1 in myFundrise) {
        print('11122  ${item1.fundraiseId}');
        if ((item.data()['fundRiseId']) == (item1.fundraiseId)) {
         var donators = {
          "userId" : id,
          "profile" : profile,
          "name" : name,
           "amount" : item.data()['amount'],
          "date" : item.data()['date'],
          "anonymous" : item.data()['isAnonymous'] 
          
         };
         myFundDonators.add(donators);
          //  data['$id']:'${item.data()['userId']}';
        }
      }
    }
    print('11122 leng ${myFundDonators.length} ');
  }

// ---------------------------------
  @override
  void onInit() {
    super.onInit();
    getDonationDetails();
    getAllUser();
    // statusFundrise();
  }
}
