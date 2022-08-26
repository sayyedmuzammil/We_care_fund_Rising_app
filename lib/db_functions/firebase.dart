// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/db_functions/user_model.dart';

//  User currentUser = FirebaseAuth.instance.currentUser!;
FirebaseFirestore _fireStore = FirebaseFirestore.instance;
Future<userModel> getUserDetails() async {
//  print("i am here ${currentUser.uid}");

  DocumentSnapshot snapshot = await _fireStore
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();
  if (snapshot.data() != null) {
    print("i am here ${snapshot.data() as Map<String, dynamic>}");
    return userModel.fromMap(snapshot.data() as Map<String, dynamic>);
  }
  return userModel(
      photoUrl: '', name: '', email: '', phoneNumber: 0, gender: '', city: '');
}

Stream<List<FundriseModel>> getFundrise() =>
    FirebaseFirestore.instance.collection('fundrise').snapshots().map((event) =>
        event.docs.map((e) => FundriseModel.fromMap(e.data())).toList());

int calculateExpiryDate(String endDate) {
  DateTime now = DateTime.now();
  DateTime expiryDate = DateTime.parse(endDate);
  int reminingDate = expiryDate.difference(now).inDays;
  return reminingDate;
}

// ----------------------------------------------status change

Future<bool> changeStatus(String newStatus, String fundId) async {
  bool completed = false;

  final fundDb = await FirebaseFirestore.instance
      .collection('fundrise')
      .doc(fundId)
      .update({'status': newStatus}).then((value) {
    completed = true;
  });

  return completed;
}


// ------------------------------------------------
