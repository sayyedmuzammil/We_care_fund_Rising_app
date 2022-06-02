// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/screen_main_page.dart';

import '../constant_design.dart';

class ScreenPinGenerate extends StatefulWidget {
  const ScreenPinGenerate({Key? key}) : super(key: key);

  @override
  State<ScreenPinGenerate> createState() => _ScreenPinGenerateState();
}

class _ScreenPinGenerateState extends State<ScreenPinGenerate> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: const Text(
          "Create Your PIN",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Styles.primary_green,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Please remember this PIN because it will be used when you want to donate. ",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Column(
              children: [
                const Text(
                  "Create PIN",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Styles.KHeight20,
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: true,
                        obscuringWidget: Container(),
                        blinkWhenObscuring: false,
                        enablePinAutofill: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "please enter the OTP";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          selectedFillColor: Colors.white,
                          selectedColor: Colors.transparent,
                          inactiveFillColor: Colors.white,
                          inactiveColor: Colors.transparent,
                          shape: PinCodeFieldShape.circle,
                          fieldHeight: 20,
                          fieldWidth: 20,
                          activeFillColor: Styles.primary_green,
                          activeColor: Colors.transparent,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          hasError = false;
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "Invalid OTP" : "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13.w,
              width: 100.w,
              child: TextButton(
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Styles.primary_green,
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0)),
                  side: const BorderSide(color: Styles.primary_green),
                ),
                onPressed: () {
                  formKey.currentState!.validate();
                  // conditions for validating
                  if (currentText.length != 6 || currentText != "123456") {
                    errorController!.add(ErrorAnimationType
                        .shake); // Triggering error shake animation
                    setState(() => hasError = true);
                  } else {
                    setState(
                      () {
                        hasError = false;
                        snackBar("OTP Verified!!");
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ScreenMainPage(),
                          ),
                          (route) => false,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
