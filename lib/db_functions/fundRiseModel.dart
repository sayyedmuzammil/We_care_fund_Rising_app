// ignore_for_file: file_names

import 'dart:typed_data';

class DonatorsModel {
  String? fundraiseId;

  Uint8List? mainImage;

  List<Uint8List>? childImage;

  String? title;

  int? category;

  int? totalRequireAmount;

  // int? raisedAmount;

  String? expireDate;

  String? fundPlan;

  String? organization;

  String? documentPdf;

  String? medicalPdf;

  String? story;
  DonatorsModel({
    this.fundraiseId,
    // required this.mainImage,
    // required this.childImage,
    required this.title,
    required this.category,
    required this.totalRequireAmount,
    // this.raisedAmount,
    required this.expireDate,
    required this.fundPlan,
    required this.organization,
    required this.documentPdf,
    this.medicalPdf,
    required this.story,
  });


  Map<String, dynamic> toMap() {
    return {
      'fundraiseId': fundraiseId,
      // 'mainImage': mainImage?.toMap(),
      // 'childImage': childImage?.map((x) => x?.toMap())?.toList(),
      'title': title,
      'category': category,
      'totalRequireAmount': totalRequireAmount,
      'expireDate': expireDate,
      'fundPlan': fundPlan,
      'organization': organization,
      'documentPdf': documentPdf,
      'medicalPdf': medicalPdf,
      'story': story,
    };
  }

  factory DonatorsModel.fromMap(Map<String, dynamic> map) {
    return DonatorsModel(
      fundraiseId: map['fundraiseId'],
      // mainImage: map['mainImage'] != null ? Uint8List.fromMap(map['mainImage']) : null,
      // childImage: map['childImage'] != null ? List<Uint8List>.from(map['childImage']?.map((x) => Uint8List.fromMap(x))) : null,
      title: map['title'],
      category: map['category']?.toInt(),
      totalRequireAmount: map['totalRequireAmount']?.toInt(),
      expireDate: map['expireDate'],
      fundPlan: map['fundPlan'],
      organization: map['organization'],
      documentPdf: map['documentPdf'],
      medicalPdf: map['medicalPdf'],
      story: map['story'],
    );
  }

 
}
