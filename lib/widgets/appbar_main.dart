 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant_design.dart';

AppBar appBarMain(BuildContext context,String title,bool isVisible,   [icon] ) {
    return AppBar(
      elevation: 0,
      backgroundColor: Styles.primary_black,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset("assets/images/main_logo.svg"),
            ));
      }),
      actions: [
        Visibility(
          visible: isVisible, 
          child:isVisible?icon:Container() ,
        ),
        /* IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/noti_svg.svg")),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/bookmark_svg.svg")), */
        const SizedBox(
          width: 15,
        ),
      ],
    );
}