import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/screen_main_page.dart';
import 'package:we_care/screens/screenWelcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return 
    Sizer(
      builder: (context, orientation, deviceType) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
    
        primarySwatch: Colors.green,
      ),
      home:  ScreenWelcome(),  
    );
      });
  }
}
