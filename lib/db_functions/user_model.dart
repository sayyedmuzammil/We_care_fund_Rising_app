// ignore_for_file: camel_case_types

import 'dart:typed_data';

class userModel {
  String? userId;

  String? photoUrl;
  // Uint8List
  // String? password;

  String? sixDigitPass;
  
  String? name;

  String? email;

  int? phoneNumber;

  String? gender;

  String? city;

  String? about;

  List<String>? interests;
 
  userModel({
    this.userId,
    required this.photoUrl,
    this.sixDigitPass,
   required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.city,
    this.about,
    this.interests,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'photoUrl': photoUrl,
      'sixDigitPass': sixDigitPass,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'city': city,
      'about': about,
      'interests': interests,
    };
  }

  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(
      userId: map['userId'],
      photoUrl: map['photoUrl'],
      sixDigitPass: map['sixDigitPass'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber']?.toInt(),
      gender: map['gender'],
      city: map['city'],
      about: map['about'],
      interests: map['interests'],
    );
  }

 
}
