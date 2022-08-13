import 'package:flutter/material.dart';

import '../../../../constant_design.dart';
import '../models/chat_message.dart';

class MessageStatusDot extends StatelessWidget {
  String status;
   MessageStatusDot({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dotColor(status) {
      switch (status) {
        case 'not_sent':
          return Colors.red;
        case 'not_view':
          return Styles.primary_green_light;
        case 'viewed':
          return Styles.primary_green.withOpacity(.8);
        default:
          return Colors.transparent;
      } 
    }

    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 12,
      width: 12,
      decoration:
          BoxDecoration(color: dotColor(status), shape: BoxShape.circle),
      child: Icon(
        status == 'not_sent' ? Icons.close : Icons.done,
        size: 8,
        color: Colors.white,
      ),
    );
  }
}
