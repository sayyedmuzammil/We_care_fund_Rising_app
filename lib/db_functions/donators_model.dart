// ignore_for_file: unused_import

import 'dart:convert';

class DonatorsModel {
  String? donationId;

  String? userId;

  String? fundRiseId;

  String? fundRiseUserID;

  String? date;

  int? amount;

  bool? isAnonymous;

  DonatorsModel({
    // this.donationId,
    // required this.userId,
    required this.fundRiseId,
    required this.fundRiseUserID,
    required this.date,
    required this.amount,
    this.isAnonymous,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'donationId': donationId,
      // 'userId': userId,
      'fundRiseId': fundRiseId,
      'fundRiseUserID': fundRiseUserID,
      'date': date,
      'amount': amount,
      'isAnonymous': isAnonymous,
    };
  }

  static DonatorsModel fromMap(Map<String, dynamic> map) {
    return DonatorsModel(
      // donationId: map['donationId'],
      // userId: map['userId'],
      fundRiseId: map['fundRiseId'],
      fundRiseUserID: map['fundRiseUserID'],
      date: map['date'],
      amount: map['amount'],
      isAnonymous: map['isAnonymous'],
    );
  }
}
