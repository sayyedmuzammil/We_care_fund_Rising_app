// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import '../constant_design.dart';

AppBar AppBarHead(title, [bool isBackButton=true]) {
    return AppBar(
      elevation: 0,
      backgroundColor: Styles.primary_black,
      centerTitle: true, 
      title:  Text(
      title,  
        style:const TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      leading: isBackButton? Builder(builder: (BuildContext context) {
        return IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Styles.primary_green,
                )));
      }):Container()
    );
  }