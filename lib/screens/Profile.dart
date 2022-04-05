import 'package:flutter/material.dart';
import 'package:we_care/constant_design.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Text("Profile", style: Styles.Header.copyWith(color: Styles.primary_black), ) ,
    );
  }
}