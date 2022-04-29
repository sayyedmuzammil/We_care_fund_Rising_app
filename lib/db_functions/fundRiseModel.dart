import 'dart:convert';

// ignore_for_file: file_names


class fundriseModel {
  String? fundraiseId;

  String? userId;

  String? mainImage;

  List<String>? childImage;

  String? title;

  String? category;

  int? totalRequireAmount;

  // int? raisedAmount;

  String? expireDate;

  String? fundPlan;

  String? organization;

  String? documentPdf;

  String? medicalPdf;

  String? story;

  String? status;

  int? fundriseAmount; 

  int? donatorsCount; 
  fundriseModel({
    this.fundraiseId,
    this.userId,
    this.mainImage,
    this.childImage,
    this.title,
    this.category,
    this.totalRequireAmount,
    this.expireDate,
    this.fundPlan,
    this.organization,
    this.documentPdf,
    this.medicalPdf,
    this.story,
    this.status,
    this.fundriseAmount,
    this.donatorsCount,
  });


  Map<String, dynamic> toMap() {
    return {
      'fundraiseId': fundraiseId,
      'userId': userId,
      'mainImage': mainImage,
      'childImage': childImage,
      'title': title,
      'category': category,
      'totalRequireAmount': totalRequireAmount,
      'expireDate': expireDate,
      'fundPlan': fundPlan,
      'organization': organization,
      'documentPdf': documentPdf,
      'medicalPdf': medicalPdf,
      'story': story,
      'status': status,
      'fundriseAmount': fundriseAmount,
      'donatorsCount': donatorsCount,
    };
  }

  static fundriseModel fromMap(Map<String, dynamic> map) {
    return fundriseModel(
      fundraiseId: map['fundraiseId'],
      userId: map['userId'],
      mainImage: map['mainImage'],
      childImage: List<String>.from(map['childImage']),
      title: map['title'],
      category: map['category'],
      totalRequireAmount: map['totalRequireAmount']?.toInt(),
      expireDate: map['expireDate'],
      fundPlan: map['fundPlan'],
      organization: map['organization'],
      documentPdf: map['documentPdf'],
      medicalPdf: map['medicalPdf'],
      story: map['story'],
      status: map['status'],
      fundriseAmount: map['fundriseAmount']?.toInt(),
      donatorsCount: map['donatorsCount']?.toInt(),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory fundriseModel.fromJson(String source) => fundriseModel.fromMap(json.decode(source));
}
