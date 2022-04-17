// ignore_for_file: unused_import

import 'dart:convert';

class DonatorsModel {
  String? donationId;

  String? userId;

  String? fundRiseId;

  String? date;

  int? amount;

  String? isAnonymous;
  
  DonatorsModel({
    this.donationId,
    required this.userId,
    required this.fundRiseId,
    required this.date,
    required this.amount,
    this.isAnonymous,
  });

  // String? favourite;


  Map<String, dynamic> toMap() {
    return {
      'donationId': donationId,
      'userId': userId,
      'fundRiseId': fundRiseId,
      'date': date,
      'amount': amount,
      'isAnonymous': isAnonymous,
    };
  }

  factory DonatorsModel.fromMap(Map<String, dynamic> map) {
    return DonatorsModel(
      donationId: map['donationId'],
      userId: map['userId'],
      fundRiseId: map['fundRiseId'],
      date: map['date'],
      amount: map['amount']?.toInt(),
      isAnonymous: map['isAnonymous'],
    );
  }

 
}
