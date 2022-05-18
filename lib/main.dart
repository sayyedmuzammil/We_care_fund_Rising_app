// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screen_main_page.dart';
import 'package:we_care/screens/signup_signin/Screen_signup.dart';
import 'admin_side/admin_main_sscren.dart';
import 'screens/signup_signin/screenWelcome.dart';

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
  //       builder: (context, child) {
  //   return ScrollConfiguration(
  //     behavior: MyBehavior(),
  //     child: ScrollView(),
  //   );
  // },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'SourceSansPro',
          primarySwatch: Colors.green,
        ),
        home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
          
         
            if (snapshot.hasData) {
                 User datas=snapshot.data! as User;
            // print("7777 ${datas['email']}");
            print("777 ${datas.email}");
            if(datas.email=='admin@gmail.com'){
              return AdminScreenMain();
            }
              return ScreenMainPage();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return ScreenWelcome();
            }
            
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Styles.primary_green,
              ),
            );
          }
          return SignupScreen();
        },
      ),
      );
    });
  }
}
