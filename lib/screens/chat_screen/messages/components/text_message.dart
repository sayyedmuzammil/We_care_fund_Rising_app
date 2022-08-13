import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant_design.dart';
import '../models/chat_message.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
    required this.isSamePerson,
  }) : super(key: key);

  final ChatMessage message;
  final bool isSamePerson;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 70.w),
      // margin: EdgeInsets.only(top: message.isSender?0:isSamePerson?0:10), //!message.isSender ? !isSamePerson? 10 : 0:0
      // margin: EdgeInsets.symmetric( vertical: 10 ),
      // decoration: BoxDecoration(color: message.isSender? Styles.primary_green:Styles.primary_black_light, borderRadius: BorderRadius.circular(30 ) ),
      child: Bubble(
        nip: isSamePerson
            ? BubbleNip.no
            : message.isSender
                ? BubbleNip.rightTop
                : BubbleNip.leftTop,
        color: message.isSender
            ? Styles.primary_green.withOpacity(.7)
            : Styles.primary_black_light,
        child: Text(
          message.text,
          // textAlign: TextAlign.left,
          style: Styles.RegularText.copyWith(
              color: message.isSender ? Colors.white : Colors.white),
        ),
      ),
    );
  }
}
