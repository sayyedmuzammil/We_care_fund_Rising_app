// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/signup_signin/screenPinGenerator.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.primary_black,
        appBar: AppBar(
          backgroundColor: Styles.primary_black,
          elevation: 0,
          title: const Text(
            "Select Your Interest",
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
            children: [
              const Text(
                "Choose your interest to donate. Don't worry, you can always change it later.",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Styles.KHeight20,
              SizedBox(
                height: 70.h,
                child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 2.0,
                    children: List.generate(12, (index) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Styles.primary_black_light,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 25.w,
                          width: 25.w,
                          child: Column(
                            children: const [
                              Styles.KHeight20,
                              Icon(
                                Icons.palette_outlined,
                                size: 44,
                                color: Styles.primary_green,
                              ),
                              Text(
                                "Education",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenPinGenerate()),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
  
}
