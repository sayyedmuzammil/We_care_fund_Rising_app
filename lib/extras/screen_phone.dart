// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/signup_signin/screen_fill_profile.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({Key? key}) : super(key: key);

  @override
  State<PhoneAuthentication> createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController otpCodeController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationIdRecieved = '';

  bool otpCodeVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Auth'),
      ),
      body: Column(
        children: [
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone',
            ),
            keyboardType: TextInputType.phone,
          ),
          Styles.KHeight20,
          Visibility(
            visible: otpCodeVisible,
            child: TextField(
                controller: otpCodeController,
                decoration: const InputDecoration(labelText: 'code')),
          ),
          Styles.KHeight20,
          ElevatedButton(
              onPressed: () {
                if (otpCodeVisible) {
                  verifyCode();
                } else {
                  verifyNumber();
                }
              },
              child: Text(otpCodeVisible ? "Login" : "verify")),
        ],
      ),
    );
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) => {
                print("your logged in successfully"),
              });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationIdRecieved = verificationId;
          otpCodeVisible = true;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdRecieved,
        smsCode: otpCodeController.text);
    await auth.signInWithCredential(credential).then((value) => {
          print("you are logged in successfully"),
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => FillProfile(),
            ),
            (route) => false,
          ),
        });
  }
}
