import 'package:flutter/material.dart';
import 'package:we_care/constant_design.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Text("inbox", style: Styles.Header.copyWith(color: Styles.primary_black), ) ,
    );
  }
}